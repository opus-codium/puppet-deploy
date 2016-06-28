class deploy inherits deploy::params {
  user { $deploy::user:
    ensure => present,
    system => $deploy::system,
  }
  file { $deploy::home:
    ensure => directory,
    owner  => $deploy::user,
    group  => $deploy::group,
    mode   => '0755',
  }
}
