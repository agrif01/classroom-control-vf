define users::managed_user {  
$user = title,
$group = title,
} {

  user { $user : 
  ensure=> present,
  home => "/home/${user}",
  }
  
  file { "/home/${user}" ,
   ensure => directory,
   owner => $user,
   group => $group
  }
}
