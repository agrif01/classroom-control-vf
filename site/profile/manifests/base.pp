#class profile::base {
#  notify { "Hello, my name is ${::hostname}": }
#}

class profile::base {
  $message = hiera('message')
  notify ($message :)
}
