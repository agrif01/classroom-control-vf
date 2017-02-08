class { 'users/manifests/init.pp':
   user { 'fundamentals'
   ensure   => present,
   }
}
