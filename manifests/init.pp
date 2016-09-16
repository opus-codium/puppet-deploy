define deploy (
  $user = $title,
  $group = $title,
  $home = "/home/${title}",
  $system = true,
  $manage_user = true,
) {
  if $manage_user {
    user { $user:
      ensure     => present,
      home       => $home,
      system     => $system,
      managehome => true,
    }
  }
  exec { "/usr/bin/ssh-keygen -q -f ${home}/.ssh/id_rsa -N ''":
    user    => $user,
    group   => $group,
    creates => "${home}/.ssh/id_rsa.pub",
  }
}
