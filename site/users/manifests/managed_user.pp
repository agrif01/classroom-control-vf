define users::managed_user (
$user = $input1, $group = $input2
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



