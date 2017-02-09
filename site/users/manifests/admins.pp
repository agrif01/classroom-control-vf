class users::admins {
users::managed_user { 'joe','wls' : }
users::managed_user { 'alice', 'wls' : }
users::managed_user { 'chen', 'wls' : }

group { 'wls':
ensure => present,
}
}




