class nodeapp::core {
    notice("I am a node $::appname and want the software")

    exec { "$::appname-download_config":
        command => "s3cmd -c /etc/s3cmd.cfg sync --no-progress --delete-removed s3://data-pipe-bootstrap/etc/datapiper/ /etc/datapiper/",
        path    => "/usr/local/bin/:/usr/bin/:/bin/",
        cwd     => "/etc/",
        require => Class['nodeapp::prework'],
    } ->

    exec { "$::appname-download_src":
        command => "s3cmd -c /etc/s3cmd.cfg sync --no-progress --delete-removed s3://data-pipe-bootstrap/src/ /srv/",
        path    => "/usr/local/bin/:/usr/bin/:/bin/",
        cwd     => "/srv/",
        require => Class['nodeapp::prework'],
    } ->

    exec { "$::appname-unpack_src":
        command => "tar -zxvf *.tar.gz",
        path    => "/usr/local/bin/:/usr/bin/:/bin/",
        cwd     => "/srv/",
        require => Class['nodeapp::prework'],
    } ->

    file { '/srv/$::appname/app/config/config.js':
        ensure => link,
        target => '/etc/$::appname/config.js',
    }

    include nodeapp::system

}
