#/etc/puppetlabs/code/environments/production/modules/ssh/manifests/init.pp

class users {
user { 'fundamentals':
  ensure => present,
# password => 'puppet8#labs', # Windows requires a plain text password
# groups => ['Users'], # Display in Windows Control Panel
}
include users::admins
}
