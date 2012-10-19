class mysql::mysql {
    service { "mysql":
        ensure => running,
        require => Package["mysql-server"],
    }

    package { ["mysql-server"]:
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }
}