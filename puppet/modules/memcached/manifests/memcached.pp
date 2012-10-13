class memcached::memcached {
    package { "libmemcached-dev":
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }

    package { "memcached":
        ensure => latest,
        require => Package["libmemcached-dev"],
    }

	service { "memcached":
        ensure => running,
        require => Package["memcached"],
    }
}