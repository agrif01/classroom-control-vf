class skelton {

  file { '/etc/skelt' :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  
  file { '/etc/skelt/.bashrc' :
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/skelton/bashrc',
  }


}
