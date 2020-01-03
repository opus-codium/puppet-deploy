# @summary Manage deployment users SSH keys
#
# @param user Name of the user
# @param group Group of the user
# @param home Home directory of the user
# @param system Indicates if the user is a system user
# @param manage_user Indicate if the user should be managed by the module
define deploy (
  String  $user        = $title,
  String  $group       = $title,
  String  $home        = "/home/${title}",
  Boolean $system      = true,
  Boolean $manage_user = true,
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
