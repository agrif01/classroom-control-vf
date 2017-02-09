define users::managed_user (
$user = $input1, $group = $input2
)
{
file { "/home/${input1}":
ensure => directory,
owner => $input1,
group => $input2,
}
}
