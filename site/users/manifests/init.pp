class users {     
              user { 'fundamentals': 
              ensure => present,   
              }
              notify { "User was created": }
                  
          }
