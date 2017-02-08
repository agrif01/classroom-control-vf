class skelton {
  file { '/etc/skel':
        ensure => directory,
        owner => root,
        group => root,
        mode => 755
        }
  file { '/etc/skel/.bashrc':
        ensure => file,
        owner => root,
        group => root,
        mode => 0644
        source => 'puppet:///modules/skelton/bashrc',
        }
     }
