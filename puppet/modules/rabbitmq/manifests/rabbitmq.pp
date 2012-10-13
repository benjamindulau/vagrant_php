class rabbitmq::rabbitmq {
	file { "rabbitmq.list":
        path => "/etc/apt/sources.list.d/rabbitmq.list",
        ensure => file,
        owner => "root",
        group => "root",
        content => "deb http://www.rabbitmq.com/debian/ testing main",
        notify => Exec["rabbitMqKeys"]
    }

	exec { "rabbitMqKeys":
        command => "wget -q -O - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -",
        path => ["/bin", "/usr/bin"],
        notify => Exec["aptGetUpdate"],
        unless => "apt-key list | grep rabbitmq"
    }

	package { "rabbitmq-server":
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }

	service { "rabbitmq-server":
        ensure => running,
        require => Package["rabbitmq-server"],
        subscribe => Exec["rabbitmq_management"],
    }

	exec { "rabbitmq_management":
        command => "rabbitmq-plugins enable rabbitmq_management",
        path => ["/bin", "/usr/bin", "/usr/sbin"],
        require => Package["rabbitmq-server"],
		unless => "rabbitmq-plugins list -E | grep rabbitmq_management",
    }
}
