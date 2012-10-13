class php5::php54dotdeb {
    exec { "aptGetUpdate":
        command => "apt-get update",
        path => ["/bin", "/usr/bin"]
    }

    file { "dotdeb.list":
        path => "/etc/apt/sources.list.d/dotdeb.list",
        ensure => file,
        owner => "root",
        group => "root",
        content => "deb http://ftp.ch.debian.org/debian squeeze main contrib non-free\ndeb http://packages.dotdeb.org squeeze all\ndeb-src http://packages.dotdeb.org squeeze all\ndeb http://packages.dotdeb.org squeeze-php54 all\ndeb-src http://packages.dotdeb.org squeeze-php54 all",
        notify => Exec["dotDebKeys"]
    }

    exec { "dotDebKeys":
        command => "wget -q -O - http://www.dotdeb.org/dotdeb.gpg | sudo apt-key add -",
        path => ["/bin", "/usr/bin"],
        notify => Exec["aptGetUpdate"],
        unless => "apt-key list | grep dotdeb"
    }

    package { ["php5-apc", "php5-xhprof"]:
        ensure => latest,
        require => Package["libapache2-mod-php5"],
        notify => Service["apache2"],
    }

    package { ["phpapi-20090626", "php-apc"]:
        ensure => purged,
    }
}