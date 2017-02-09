class users (
  $message 
){

  notify { $message: }

  user { 'fundamentals' :
    ensure => present,
  }

}
