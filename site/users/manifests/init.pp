class users {
  user {'fundamentals':
    ensure => 'present',
  }
  include admins,
}
