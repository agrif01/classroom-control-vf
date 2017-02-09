class nginx (
    $package  = $nginx::params::package,
    $owner    = $nginx::params::owner,
    $group    = $nginx::params::group,
    $docroot  = $nginx::params::docroot,
    $confdir  = $nginx::params::confdir,
    $blockdir = $nginx::params::blockdir,
    $logdir   = $nginx::params::logdir,
    $user     = $nginx::params::user,
) inherits nginx::params {

File {
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
}
package { 'nginx' :
  ensure => present,
}

file { '/var/www' :
  ensure => directory,
  }

file { '/var/www/index.html' :
  ensure => file,
    source => 'puppet:///modules/nginx/index.html',
}
  

file { '/etc/nginx/nginx.conf' :
  ensure  => file,
  source  => 'puppet:///modules/nginx/nginx.conf',
  require =>  Package['nginx'],
  notify  => Service['nginx'],
}


file { '/etc/nginx/conf.d/default.conf' :
  ensure  => file,
  source  => 'puppet:///modules/nginx/default.conf',
  require => Package['nginx'],
  notify  => Service['nginx'],
}

service { 'nginx' :
  ensure => running,
  enable => true,
}



}
