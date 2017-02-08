class site::users {     
              user { 'fundamentals': 
              ensure => present,     
              notify { "User was created": }
              }        
          }
