class users::admins {
users::managed_user { 'joe','OHS': }
users::managed_user { 'alice', 'OHS':}
users::managed_user { 'chen', 'OHS':}

group { 'OHS':
ensure => present,
}
}
