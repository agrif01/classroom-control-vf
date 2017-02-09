class nginx (

    $package  = 'nginx'
    $owner    = 'root'
    $group    = 'root'
    $docroot  = '/var/www'
    $confdir  = '/etc/nginx'
    $blockdir = '/etc/nginx/conf.d'
    $logdir   = '/var/log/nginx'
    $user     = $nginx::params::user,
    ) inherits nginx::params 
    
 {
    
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
