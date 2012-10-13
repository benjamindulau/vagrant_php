class mysql::mysql {
    service { "mysql":
        ensure => running,
        require => Package["mysql-server"],
    }

    package { ["mysql-client", "mysql-server"]:
        ensure => latest,
    }
}