class users::init {     
              user { 'fundamentals': 
              ensure => present,     
              notify { "User was created": }
              }        
          }
