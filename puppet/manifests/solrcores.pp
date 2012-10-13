class solrcores {
    solr::cores {"cores":
        cores => {
            strobbr_strobb => {instance_dir => "/var/solr/strobbr/strobb", data_dir => "/var/solr/strobbr/strobb"},
            strobbr_user => {instance_dir => "/var/solr/strobbr/user", data_dir => "/var/solr/strobbr/user"},
        }
    }
}