define users::managed_user (
  $user = $title,
  $group= $title,
  )
  {
  
  user{ "${title}":
     ensure => present,
  }
  
  file{ "/home/${title}":
    ensure => directory,
    owner => $title,
    group => $title,
    }
 }
