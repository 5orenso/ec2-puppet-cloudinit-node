class nodeapp::core {
    notice("I am a node ${::appname} and want the software")

    exec { "nodeapp_download_config":
        command => "git clone ${::gitconfigrepo} /srv/config/",
        path    => "/usr/local/bin/:/usr/bin/:/bin/",
        cwd     => "/srv/",
        require => Class["nodeapp::prework"]
    } ->

    exec { "nodeapp_download_src":
        command => "git clone ${::gitrepo} /srv/${::appname}/",
        path    => "/usr/local/bin/:/usr/bin/:/bin/",
        cwd     => "/srv/",
        require => Class["nodeapp::prework"]
    } ->

    exec { "nodeapp_unpack_src":
        command => "npm install --production",
        path    => "/usr/local/bin/:/usr/bin/:/bin/",
        cwd     => "/srv/${::appname}/",
        require => Class["nodeapp::prework"]
    } ->

    file { "nodeapp_configfile":
        name   => "/srv/${::appname}/app/config/config.js",
        ensure => link,
        target => "/srv/config/${::appname}/config.js"
    }

    include nodeapp::system
}
