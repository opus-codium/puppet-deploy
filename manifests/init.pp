define deploy (
  $user = 'deploy',
  $group = 'deploy',
  $home = '/home/deploy',
  $system = true,
) {
  user { $user:
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
