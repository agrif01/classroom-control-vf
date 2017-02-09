define users::managed_user (
$name = $input1, $group = $input2
) {
user { $title:
ensure => present,
}
file { "/home/${input1}":
ensure => directory,
owner => $input1,
group => $input2,
}
}
