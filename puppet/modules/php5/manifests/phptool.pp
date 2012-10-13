class php5::phptool {
    package { ["build-essential", "php5-dev", "php-pear"]:
        ensure => latest,
        require => Package["libapache2-mod-php5"],
        notify => Service["apache2"]
    }
}
