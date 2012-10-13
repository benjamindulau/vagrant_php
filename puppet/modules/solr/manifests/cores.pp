define solr::cores (
    $solr_conf = "/etc/solr/solr.xml",
	$template = "solr/solr.xml.erb",
    $cores
) {

    file { "${solr_conf}":
        content => template($template),
        owner   => "root",
        group   => "root",
        mode    => "755",
        notify  => Service["tomcat6"],
    }
}