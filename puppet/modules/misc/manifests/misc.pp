class misc::misc {
    package { ["vim", "git", "curl", "nfs-common"]:
        ensure => latest,
    }
}