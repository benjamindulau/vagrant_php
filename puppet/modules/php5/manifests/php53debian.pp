class php5::php53debian {
    package { "php-apc":
        ensure => latest,
        require => Package["libapache2-mod-php5"]
    }

    file { "dotdeb.list":
        path => "/etc/apt/sources.list.d/dotdeb.list",
        ensure => absent,
        notify => Exec["aptGetUpdate"],
    }
}