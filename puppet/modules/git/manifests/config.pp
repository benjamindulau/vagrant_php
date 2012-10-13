define git::config (
    $name = "",
	$email = "",
    $autocrlf = false,
	$filemode = false,
	$editor = "vim",
	$mergetool = "vimdiff"
) {
    if $name != "" {
        git::configSet{"user.name": value => "${name}"}
    }

    if $email != "" {
        git::configSet{"user.email": value => "${email}"}
    }

    if $autocrlf != "" {
        git::configSet{"core.autocrlf": value => $autocrlf}
    }

    if $filemode != "" {
        git::configSet{"core.filemode": value => $filemode}
    }

    if $editor != "" {
        git::configSet{"core.editor": value => "${editor}"}
    }

    if $mergetool != "" {
        git::configSet{"merge.tool": value => "${mergetool}"}
    }
}

define git::configSet ($value) {
    $gitconfig = "/home/vagrant/.gitconfig"

    exec { "git::config set $name":
        command => "git config --file $gitconfig \"$title\" \"$value\"",
        unless => "git config --file $gitconfig --get \"$title\" \"$value\"",
        path => ["/bin", "/usr/bin"],
        require => Package["git"],
    }
}