define users::managed_user (
$input1 = $var1, $input2 = $var2
)
{
file { "/home/${var11}":
ensure => directory,
owner => $var1,
group => $var2,
}
}
