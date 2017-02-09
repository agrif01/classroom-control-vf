class nginx {

case $facts['os']['family] {
  'RedHat', 'Debian' : {
    $package  = 'nginx'
    $owner    = 'root'
    $group    = 'root'
    $docroot  = '/var/www'
    $confdir  = '/etc/nginx'
    $blockdir = '/etc/nginx/conf.d'
    $logdir   = '/var/log/nginx'
  }
  'windows' : {
    $package  = 'nginx-service'
    $owner    = 'Administrator'
    $group    = 'Administrators'
    $docroot  = 'C:/ProgramData/nginx/html'
    $confdir  = 'C:/ProgramData/nginx'
    $blockdir = 'C:/ProgramData/nginx/conf.d'
    $logdir   = 'C:/ProgramData/nginx/logs'
  }
  default: fail("Operating system is not supported by this module")
}

$user = $facts['os']['family'] ? {
  'RedHat'  => 'nginx',
  'Debian'  => 'www-data',
  'windows' => 'nobody',
   default   => 'nginx',
}

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
  source => 'puppet:///modules/nginx/index.html',
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
