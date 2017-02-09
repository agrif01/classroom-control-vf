class nginx {

case $facts['os']['family'] {
	'debian': {
		$pkgname => 'nginx' 
		$fowner => 'root' 
		$fgroup  => 'root'
		$docroot  => '/var/www' 
		$configdir  => '/etc/nginx/' 
		$svrblkdir  => '/etc/nginx/conf.d'
		$logdir  => '/var/log/nginx' 
		$svcname  => 'nginx' 
		$usrsrvrunas =>  'www-data' 
	}
	'windows': {
		$pkgname =>  'nginx-service'
		$fowner =>  'Administrator'
		$fgroup  => 'Administrators'
		$docroot  =>  'C:/ProgramData/nginx/html'
		$configdir  =>  'C:/ProgramData/nginx'
		$svrblkdir  => 'C:/ProgramData/nginx/conf.d'
		$logdir  =>  'C:/ProgramData/nginx/logs'
		$svcname  =>  'nginx'
		$usrsrvrunas => 'nobody'
	}
	'redhat': {
		$pkgname => 'nginx' 
		$fowner => 'root' 
		$fgroup  => 'root'
		$docroot  => '/var/www' 
		$configdir  => '/etc/nginx/' 
		$svrblkdir  => '/etc/nginx/conf.d'
		$logdir  => '/var/log/nginx' 
		$svcname  => 'nginx'
		$usrsrvrunas => 'nginx' 
	}
	default: {
		fail("Operating system family ${facts['os']['family']} is not supported.")
	}
}

FILE {
        owner => '${fowner}',
        group => '${fgroup}' ,
        mode => '0664' ,
     }
  package { '${pkgname}':
        ensure => present,
     {
  file { '${docroot} :
        ensure => directory,
        mode => '0755' ,
     }
 file { '${docroot}/index.html' :
        ensure => file,
        source =>'puppet:///modules/nginx/index.html' ,
     }
 file { '${configdir}/nginx.conf':
       ensure => file ,
        #source => 'puppet:///modules/nginx/nginx.conf' ,
	content => epp(nginx/nginx.conf.epp'
	    {
	       usrsrvrunas => ${usrsrvrunas},
	       configdir => ${configdir},
	       logdir => ${logdir}.
	    }),
       require => Package['nginx'] ,
       notify => Service['nginx'] ,
    }
    
   file { '${svrblkdir}':
   ensure => directory,
   mode => '0775',
   }
  file { '${svrblkdir}/default.conf':
    ensure => file,
    #source => 'puppet:///modules/nginx/default.conf',
    content => epp(nginx/nginc.default.epp',
        {
	    docroot => ${docroot},
	}),
    require => Package['${pkgname}'],
    notify => Service['${svcname}'],
  }
  service { '${svcname}':
   ensure => running,
   enable => true,
  }
}


