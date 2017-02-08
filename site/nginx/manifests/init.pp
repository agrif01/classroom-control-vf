class nginx {
  
  user {'nginx';
    ensure => present,
    }
}
