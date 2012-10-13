class git::git {
    package { "git":
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }
}