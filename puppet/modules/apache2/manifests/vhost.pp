define apache2::vhost (
    $type = "default",
	$port = "80",
    $docroot,
	$servername = "",
	$options = "-Indexes FollowSymLinks MultiViews",
	$vhost_name = "*"
) {

    if $servername == "" {
        $srvname = "${title}.local"
    } else {
        $srvname = $servername
    }
  
    $vhostdir = "/etc/apache2/sites-available"
   
    case $type {
        "default": { $template = "apache2/default.conf.erb" }
        "symfony": { $template = "apache2/symfony.conf.erb" }
    }
  
    file { "${vhostdir}/${title}":
        content => template($template),
        owner   => "root",
        group   => "root",
        mode    => "755",
        require => Package["apache2-mpm-prefork"],
        notify  => Exec["a2ensite"],
    }

    exec { "a2ensite":
        command => "a2ensite ${title}",
        path => ["/bin", "/usr/bin", "/usr/sbin"],
        require => Package["apache2-mpm-prefork"],
        notify => Service["apache2"],
    }
}
