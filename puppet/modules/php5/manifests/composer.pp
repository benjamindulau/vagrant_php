class php5::composer {
    exec { "composerPhar":
        cwd => "/vagrant",
        command => "curl -s http://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer",
        path => ["/bin", "/usr/bin"],
        creates => "/usr/local/bin/composer",
        require => Package["php5-cli", "curl", "git"],
    }
}