class php5::mysql {
    package { ["php5-mysql"]:
        ensure => latest,
        require => Package["libapache2-mod-php5", "mysql-client"],
        notify => Service["apache2"],
    }
}