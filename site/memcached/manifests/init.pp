class memcached {

   package { 'memcached' :
      ensure => present,
   }
   
   file { 'memcached' :
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => 'puppet://modules/memcached/memcached',
      require => package['memcached'],
   }
   
   service { 'memcached' :
      ensure     => running,
      enable     => true,
      subscribe  => file['/etc/sysconfig/memcached'],
   }

}
