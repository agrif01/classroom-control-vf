define users::managed_user {
	user { $title:
	ensure => present,
	    }
	file { '/home/$title':
	ensure => directory
        }
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
}
