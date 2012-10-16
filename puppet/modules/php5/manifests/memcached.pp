class php5::memcached {
    package { "php5-memcached":
        ensure => latest,
        require => Package["libmemcached-dev", "php5-cli"],
    }
}