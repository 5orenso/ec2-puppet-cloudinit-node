class datapiper::postwork {

	# define the service to start
	service { '$appname':
    	ensure  => 'running',
    	enable  => 'true',
    	require => Class['$appname::system'],
	}
	

}
