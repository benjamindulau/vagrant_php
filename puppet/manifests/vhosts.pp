class vhosts {
    apache::vhost {"my_site":
        type => "symfony",
        docroot => "/vagrant/www/my_site/web"
    }
}