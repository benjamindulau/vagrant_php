class bootstrap {
    # this makes puppet and vagrant shut up about the puppet group
    group { "puppet":
        ensure => "present",
    }

    # Set FQDN for virtualbox
    if $virtual == "virtualbox" and $fqdn == '' {
        $fqdn = "localhost"
    }

    exec { "aptGetUpdate":
        command => "apt-get update",
        path => ["/bin", "/usr/bin"]
    }

    # because puppet command are not run sequentially, ensure that packages are
    # up to date before installing before installing packages, services, files, etc.
    Package { require => Exec["aptGetUpdate"] }
    File { require => Exec["aptGetUpdate"] }
}