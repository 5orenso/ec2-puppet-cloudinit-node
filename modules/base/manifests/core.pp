class base::core {
    notice('Core beeing installed.')

    package { 'dstat' :
        ensure => installed,
    }
    package { 'g++' :
        ensure => installed,
    }
    package { 'make' :
        ensure => installed,
    }
    package { 's3cmd' :
        ensure => installed
    }

}
