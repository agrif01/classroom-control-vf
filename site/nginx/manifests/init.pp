class nginx (
    $package   = $nginx::params::package,
    $owner     = $nginx::params::owner,
    $group     = $nginx::params::group,
    $docroot   = $nginx::params::docroot,
    $confdir   = $nginx::params::confdir,
    $blockdir  = $nginx::params::blockdir,
    $logdir    = $nginx::params::logdir,
    $user      = $nginx::params::user,
) inherits nginx::params {

File {
  owner => $owner,
  group => $group,
  mode =>  '0664',
}

package { $package :
  ensure => present,
}

file { $docroot :
  ensure => directory,
  mode   => '0755',
}

file { "${docroot}/index.html" :
  ensure => file,
  #source => 'puppet:///modules/nginx/index.html',
  content => epp('nginx/index.html.epp'),
}
  

file { "${confdir}/nginx.conf" :
  ensure  => file,
  content => epp('nginx/nginx.conf.epp', { user     => $user,
                                           confdir  => $confdir,
                                           blockdir => $blockdir,
                                           logdir   => $logdir,
                                         }),
  require =>  Package[$package],
  notify  => Service['nginx'],
}


file { "${blockdir}/default.conf" :
  ensure  => file,
  content => epp('nginx/default.conf.epp', { docroot => $docroot }),
  require => Package[$package],
  notify  => Service['nginx'],
}

service { 'nginx' :
  ensure => running,
  enable => true,
}

}
