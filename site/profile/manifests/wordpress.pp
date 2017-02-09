class profile::wordpress {

user { 'wordpress' :
  ensure => present,
  before => Class['wordpress'],
}

class { 'wordpress':
  wp_owner    => 'wordpress',
  wp_group    => 'wordpress',
  db_user     => 'wordpress',
  db_password => 'anothersecretpassword',
}



}
