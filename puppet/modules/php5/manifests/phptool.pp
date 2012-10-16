class php5::phptool {
    package { ["build-essential", "php5-dev", "php-pear"]:
        ensure => latest,
        require => Package["php5-cli"],
    }
}
