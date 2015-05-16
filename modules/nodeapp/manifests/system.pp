class nodeapp::system {

	file { "$::appname-upstart":
        name => "/etc/init/$::appname.conf",
        ensure => present,
        owner => root,
        group => root,
        mode  => 644,
        source => "/etc/$::appname/upstart.conf",
        require => [Class['nodeapp::prework'], Class['nodeapp::core']],
    } ->

    file { "$::appname-logrotate":
        name => "/etc/logrotate.d/$::appname",
        ensure => present,
        owner => root,
        group => root,
        mode  => 644,
        source => "/etc/$::appname/logrotate.conf",
        require => [Class['nodeapp::prework'], Class['nodeapp::core']],
    } ->


  	file { '/etc/init.d/$::appname':
    	ensure => link,
    	target => '/lib/init/upstart-job',
  	}

	service { '$::appname':
  		ensure     => 'running',
  		# provider   => 'upstart',
  		hasrestart => 'true',
  		hasstatus  => 'false',
  		enable     => 'true',
  		subscribe  => [File['$::appname-upstart'], File['/etc/init.d/$::appname']],
	}

}