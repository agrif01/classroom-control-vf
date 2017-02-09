class users::admins {
   users::managed_user {'joe' :}
   
   users::managed_user {'alice' :}
   
   users::managed_user {'chen' :
      group => 'install', }
   
   group { 'install' :
      ensure => present,
   }
}
