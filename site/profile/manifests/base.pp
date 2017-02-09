class profile::base {
  notify { "Hello, my name is ${::hostname}": }


$message = heira('message')
notify{$message:}
}
