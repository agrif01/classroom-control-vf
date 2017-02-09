define users::managed_user {
	user { $title:
	ensure => present,
	    }
	file { "/home/${title}":
	ensure => directory,
        }
 
}
