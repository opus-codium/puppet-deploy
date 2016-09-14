class deploy (
  $user = $deploy::params::user,
  $group = $deploy::params::group,
  $home = $deploy::params::home,
  $system = $deploy::params::system,
) inherits deploy::params {
  user { $deploy::user:
    ensure     => present,
    home       => $home,
    system     => $system,
    managehome => true,
  }
  exec { "/usr/bin/ssh-keygen -q -f ${home}/.ssh/id_rsa -N ''":
    user    => $user,
    group   => $group,
    creates => "${home}/.ssh/id_rsa.pub",
  }
}
