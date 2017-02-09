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
