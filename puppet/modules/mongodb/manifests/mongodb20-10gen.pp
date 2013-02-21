class mongodb::mongodb20-10gen {
    package { "mongodb20-10gen":
        ensure => latest,
        require => [File["10gen.list"], Exec["aptGetUpdate"]],
    }
}