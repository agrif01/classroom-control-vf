define users::managed_user ( $group = $title,
)
{
   users { $title :
      ensure => present,
      group  => $group,
   }
   
   file { '/home/${title}' :
      ensure => directory,
      group  => $group,
      mode   => '0755',
      owner  => $title,
   }
}
