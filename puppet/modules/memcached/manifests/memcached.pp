class memcached::memcached {
    package { "memcached":
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }

	service { "memcached":
        ensure => running,
        require => Package["memcached"],
    }
}