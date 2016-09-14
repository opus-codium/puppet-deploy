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
}
