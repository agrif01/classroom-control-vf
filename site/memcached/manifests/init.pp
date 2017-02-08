class memcached {
  package {'memcached':
    ensure  => present,
  }
  service {'memcached':
    ensure  => running,
    require => Package['memcached'],
  }
  file {'/etc/sysconfig/memcached':
    source  => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
  }
}
