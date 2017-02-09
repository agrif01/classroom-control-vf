define users::managed_user (
$user = $title1, $group = $title2
)
{
user { $user : 
  ensure=> present,
  home => "/home/${user}",
  gid  => $group, 
  }

group { $group :
    ensure => present,
  }

file { "/home/${user}":
ensure => directory,
owner => $user,
group => $group,
}
}



