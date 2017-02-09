class profile::wordpress {

user { 'wordpress' :
  ensure => present,
  before => Class['wordpress'],
}

class { 'wordpress':
  wp_owner    => 'root',
  wp_group    => 'root',
  db_user     => 'wordpress',
  db_password => 'anothersecretpassword',
  install_dir => '/var/www/html',
}



}
