class php5::memcached {
    package { "php5-memcached":
        ensure => latest,
        require => Package["memcached", "php5-cli"],
    }
}