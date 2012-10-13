class tomcat::tomcat {
    package { "openjdk-6-jdk":
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }

    package { ["tomcat6"]:
        ensure => latest,
        require => Package["openjdk-6-jdk"],
    }

    service { "tomcat6":
        ensure => running,
        require => Package["tomcat6"],
    }

    package { ["tomcat6-admin"]:
        ensure => latest,
        require => Package["tomcat6"],
        notify => Service["tomcat6"],
    }

    package { ["tomcat6-docs", "tomcat6-examples", "tomcat6-user"]:
        ensure => latest,
        require => Package["tomcat6-admin"],
        notify => Service["tomcat6"],
    }
}