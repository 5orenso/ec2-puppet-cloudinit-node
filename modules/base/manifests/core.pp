class base::core {
    notice('Core beeing installed.')

    package { 'dstat' :
        ensure => installed,
    }
    package { 'g++' :
        ensure => installed,
    }

}
