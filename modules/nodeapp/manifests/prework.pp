class nodeapp::prework {

	file { '/srv' :
        ensure => 'directory',
        owner  => 'root',
        group  => 'www-data',
        mode   => 750,
    }

    file { '/etc/$::appname' :
        ensure => 'directory',
        owner  => 'root',
        group  => 'www-data',
        mode   => 750,
    }

    file { '/var/log/$::appname' :
        ensure => 'directory',
        owner  => 'www-data',
        group  => 'www-data',
        mode   => 750,
    }

    file { '/var/run/$::appname' :
        ensure => 'directory',
        owner  => 'www-data',
        group  => 'www-data',
        mode   => 750,
    }
    
}