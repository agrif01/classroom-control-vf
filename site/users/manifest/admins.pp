#class users::admins {

  #user {'admin':
  #  ensure => present,
  #  }
  # }


class users::admins {
users::managed_user { 'joe': }
users::managed_user { 'alice':
group => 'staff',
}
users::managed_user { 'aaron':
group => 'staff',
}
group { 'staff':
ensure => present,
}
}
