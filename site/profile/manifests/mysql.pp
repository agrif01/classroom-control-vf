class profile::mysql {

  class { '::mysql::server':
    root_password           => 'strongerpassword',
  }

  include mysql::bindings::php
}
