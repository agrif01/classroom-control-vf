class users::admins {
users::managed_user { 'joe','root': }
users::managed_user { 'alice', 'root':}
users::managed_user { 'chen', 'root':}

group { 'root':
ensure => present,
}
}
