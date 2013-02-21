class php5::mongo {
    exec { "pecl-install-mongo":
        command => "pecl install mongo",
        unless => "ls -R /usr/lib/php5 | grep mongo.so",
        path => ["/bin", "/usr/bin"],
        require => Package["php5-cli", "php-pear"],
    }

    file { "mongo.ini":
        path => "/etc/php5/conf.d/mongo.ini",
        ensure => file,
        owner => "root",
        group => "root",
        content => "extension=mongo.so",
        require => Exec["pecl-install-mongo"],
    }
}