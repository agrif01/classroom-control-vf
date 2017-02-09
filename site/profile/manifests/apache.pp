class profile::apache {

  class { 'apache': }
  include apache::mod::php
  
  apache::vhost { 'vhost.example.com':
    port    => '80',
    docroot => '/opt/wordpress',
  }
  
}
