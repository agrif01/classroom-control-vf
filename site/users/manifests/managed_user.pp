define users::managed_user(
  $user = $title,
  $group = $title,
) {

  user { $user :
    ensure => present,
  }

  $homedir = "/home/${user}"
  file { $homedir :
    ensure => directory, 
    owner => $user, 
    group => $group,
  }

  file { "${homedir}/.bashrc" :
    ensure => file,
    content => epp('users/bashrc.epp' , { user => $user }),
  }


}
