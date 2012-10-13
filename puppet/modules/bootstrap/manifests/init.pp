class bootstrap {
    # this makes puppet and vagrant shut up about the puppet group
    group { "puppet":
        ensure => "present",
    }

    # Set FQDN for virtualbox
    if $virtual == "virtualbox" and $fqdn == "" {
        $fqdn = "localhost"
    }

    exec { "aptGetUpdate":
        command => "apt-get update",
        path => ["/bin", "/usr/bin"]
    }
}