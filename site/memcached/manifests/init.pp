class memcached {

  file { '/etc/sysconfig/memcached.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/ntp/ntp.conf',
  require => Package['memcached'],
  before => Service['memcahced'],
  }
  
  package { 'memcached':
  ensure => present,
  }
  
  service { 'memcached':
  ensure => running,
  enable => true,
  subscribe => File['/etc/sysconfig/memcached.conf'],
  }

}
