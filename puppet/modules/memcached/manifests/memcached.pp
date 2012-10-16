class memcached::memcached {
    package { "memcached":
        ensure => latest,
        require => Package["libmemcached-dev"],
    }

	service { "memcached":
        ensure => running,
        require => Package["memcached"],
    }
}