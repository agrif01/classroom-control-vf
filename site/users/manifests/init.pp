class users::fundamentals {     
              user { 'fundamentals': 
              ensure => present,     
              notify { "User was created": }
              }        
          }
