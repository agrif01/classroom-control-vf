class nginx (
	$pkgname => $nginx::params::pkgname,
	$fowner => $nginx::params::fowner,
	$fgroup  => $nginx::params::fgroup,
	$docroot  => $nginx::params::docroot,
	$configdir  => $nginx::params::configdir,
	$svrblkdir  => $nginx::params::svrblkdir,
	$logdir  => $nginx::params::logdir,
	$svcname  => $nginx::params::svcname, 
	$usrsrvrunas => $nginx::params::usrsrvrunas,
	) inherits nginx::params {
	
FILE {
        owner => $fowner},
        group => $fgroup ,
        mode => '0664' ,
     }
  package { $pkgname:
        ensure => present,
     {
  file { $docroot :
        ensure => directory,
        mode => '0755' ,
     }
 file { "${docroot}/index.html" :
        ensure => file,
        source =>'puppet:///modules/nginx/index.html' ,
     }
 file { "${configdir}/nginx.conf" :
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
    
   file { $svrblkdir :
   ensure => directory,
   mode => '0775',
   }
  file { "${svrblkdir}/default.conf":
    ensure => file,
    #source => 'puppet:///modules/nginx/default.conf',
    content => epp(nginx/nginc.default.epp',
        {
	    docroot => $docroot,
	}),
    require => Package[$pkgname],
    notify => Service[$svcname],
  }
  service { $svcname:
   ensure => running,
   enable => true,
  }
}


