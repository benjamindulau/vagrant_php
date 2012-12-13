# mandatory
class { 'bootstrap': }
class { 'misc::misc': }

# PHP5
class { 'php5::php5': }
# 5.3
# class { 'php5::php53debian': }
# 5.4
class { 'php5::php54dotdeb': }
class { 'php5::phptool': }
class { 'php5::gmagick': }
class { 'php5::composer': }

# Apache2
class { 'apache2::apache2': }
#apache2::vhost {"mywebsite":
#    type => "symfony",
#    docroot => "/vagrant/web"
#}

# MySQL
class { 'mysql::mysql': }
class { 'php5::mysql': }

# Memcached
class { 'memcached::memcached': }
class { 'php5::memcached': }

# Tomcat
class { 'tomcat::tomcat': }

# Apache Solr (version 3.x or 4.x)
class { 'solr::solr': version => '4.0.0' }
#solr::cores {"cores":
#    cores => {
#        core_foo => {instance_dir => "/var/solr/core_foo", data_dir => "/var/solr/core_foo"},
#    }
#}

# RabbitMQ
class { 'rabbitmq::rabbitmq': }

# Git
class { 'git::git': }
git::config {'config':
    name => "Benjamin Dulau",
    email => "benjamin.dulau@anonymation.com",
}