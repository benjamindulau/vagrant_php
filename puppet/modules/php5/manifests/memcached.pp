class php5::memcached {
    package { "libmemcached-dev":
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }

    package { "php5-memcached":
        ensure => latest,
        require => Package["libmemcached-dev", "php5-cli"],
    }
}