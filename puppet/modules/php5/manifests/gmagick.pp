class php5::gmagick {
    package { ["libgraphicsmagick1-dev"]:
        ensure => latest,
        require => Exec["aptGetUpdate"],
		notify => Exec["gmagickInstall"],
    }

	exec { "gmagickInstall":
        command => "pecl install channel://pecl.php.net/gmagick-1.1.1RC1",
		unless => "ls -R /usr/lib/php5 | grep gmagick.so",
        path => ["/bin", "/usr/bin"],
        require => Package["libgraphicsmagick1-dev", "php5-cli", "php-pear"],
    }

	file { "gmagick.ini":
        path => "/etc/php5/conf.d/gmagick.ini",
        ensure => file,
        owner => "root",
        group => "root",
        content => "extension=gmagick.so",
        require => Exec["gmagickInstall"],
    }
}