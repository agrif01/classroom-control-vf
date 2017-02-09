define users::managed_user ( 
$user = $title,
$group = $title,
) {

  user { $user : 
  ensure=> present,
  home => "/home/${user}",
  gid  => $group, 
  }
  
  file { "/home/${user}" :
   ensure => directory,
   owner => $user,
   group => $group,
  }
  
  group { $group :
    ensure => present,
  }
}
