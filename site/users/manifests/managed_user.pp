define users::managed_user ( $group = $title,
)
{
   user { $title :
      ensure => present,
   }
   
   file { "/home/${title}" :
      ensure => directory,
      group  => $group,
      mode   => '0755',
      owner  => $title,
   }
}
