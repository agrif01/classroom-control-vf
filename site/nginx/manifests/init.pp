class nginx {
  package {'nginx':
    ensure => 'installed',
  }
  file {'nginx.conf':
    ensure => 'file',
    path   => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
  }
  file {'default.conf',
    ensure => 'file',
    path   => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/default.conf',
  }
  file {'index.html':
    ensure => 'file',
    path   => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
  }
}
