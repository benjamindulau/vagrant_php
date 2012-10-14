# mandatory !!
include bootstrap

# Tools
include misc::misc

# PHP5
include php5::php5
include php5::php54dotdeb
include php5::phptool
include php5::gmagick
include php5::composer

# Apache2
include apache2::apache2
#apache2::vhost {"mywebsite":
#    type => "symfony",
#    docroot => "/vagrant/web"
#}

# MySQL
include mysql::mysql
include php5::mysql

# Memcached
include memcached::memcached
include php5::memcached

# Apache tomcat server
include tomcat::tomcat

# Solr
include solr::solr
# define cores
#solr::cores {"cores":
#    cores => {
#        core_foo => {instance_dir => "/var/solr/core_foo", data_dir => "/var/solr/core_foo"},
#    }
#}

# RabbitMq
include rabbitmq::rabbitmq

# Git
include git::git
git::config {'config':
    name => "Benjamin Dulau",
    email => "benjamin.dulau@anonymation.com",
}


