#class users::admins {

  #user {'admin':
  #  ensure => present,
  #  }
  # }


class users::admins {
users::managed_user { 'joe': }
users::managed_user { 'alice': }
users::managed_user { 'chen': }
}
