define users::managed_user (
$input1 = $var1, $input2 = $var2
)
{
file { "/home/${input1}":
ensure => directory,
owner => $input1,
group => $input2,
}
}
