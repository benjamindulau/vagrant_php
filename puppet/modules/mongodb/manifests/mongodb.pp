class mongodb::mongodb {
    file { "10gen.list":
        path => "/etc/apt/sources.list.d/10gen.list",
        ensure => file,
        owner => "root",
        group => "root",
        content => "deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen",
        notify => Exec["10genKeys"]
    }

    exec { "10genKeys":
        command => "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10",
        path => ["/bin", "/usr/bin"],
        notify => Exec["aptGetUpdate"],
        unless => "apt-key list | grep 10gen"
    }
}