define users::managed_user (
$user = $input1, $group = $input2
) {
user { $input1:
ensure => present,
}
user { $input2:
ensure => present,
}
file { "/home/${input1}":
ensure => directory,
owner => $input1,
group => $input2,
}
}
