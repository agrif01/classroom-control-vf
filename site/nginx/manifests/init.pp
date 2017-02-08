class nginx {
  package {'nginx':
    ensure => present,
  }
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  
  $filesrc = 'puppet:///modules/nginx'
  
  file {'nginx.conf':
    ensure => file,
    path   => '/etc/nginx/nginx.conf',
    source => "${filesrc}/nginx.conf",
  }
  file {'default.conf':
    ensure => file,
    path   => '/etc/nginx/conf.d/default.conf',
    source => "${filesrc}/default.conf",
  }
  file {'index.html':
    ensure => file,
    path   => '/var/www/index.html',
    source => "${filesrc}/index.html",
  }
  file {'/var/www':
    ensure => directory,
    path   => '/var/www',
  }
  service {'nginx':
    ensure => running,
    require => Package['nginx'],
  }
}
