class php5::php5 {
    package { "php5-cli":
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }

    package { ["php5-xdebug", "php5-intl", "php5-sqlite", "php5-curl"]:
        ensure => latest,
        require => Package["libapache2-mod-php5"],
        notify => Service["apache2"]
    }

    package { "php5-suhosin":
        ensure => purged,
        notify => Service["apache2"]
    }

    file { "php-timezone.ini":
        path => "/etc/php5/cli/conf.d/30-timezone.ini",
        ensure => file,
        content => template("php5/php-timezone.ini"),
        require => Package["php5-cli"]
    }
}