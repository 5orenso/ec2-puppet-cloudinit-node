class nodeapp::postwork {

	# define the service to start
	service { '$::appname':
    	ensure  => 'running',
    	enable  => 'true',
    	require => Class['$::appname::system'],
	}
	

}
