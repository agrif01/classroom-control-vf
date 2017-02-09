define users::managed_user {  $user_name :
  ensure=> present,
  home => "$user_homedir",
  uid => "$user_uid",
  gid => "$user_group_id",
  shell = "$user_shell",

}
