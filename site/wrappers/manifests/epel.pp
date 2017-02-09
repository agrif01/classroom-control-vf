class wrappers::epel {

  class { 'epel' :
    epel_enabled => '1',
    epel_source_enabled => '1',
  }

}
