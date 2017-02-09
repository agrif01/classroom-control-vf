class profile::mysql {

  class { '::mysql::server':
    root_password           => 'strongerpassword',
  }


}
