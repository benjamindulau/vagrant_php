class php5::mysql {
    package { ["mysql-client"]:
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }

    package { ["php5-mysql"]:
        ensure => latest,
        require => Package["php5-cli", "mysql-client"],
    }
}