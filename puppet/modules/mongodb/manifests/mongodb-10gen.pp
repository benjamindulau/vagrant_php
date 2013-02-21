class mongodb::mongodb-10gen {
    package { "mongodb-10gen":
        ensure => latest,
        require => [File["10gen.list"], Exec["aptGetUpdate"]],
    }
}