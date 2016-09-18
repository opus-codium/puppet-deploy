require 'facter'

`/usr/bin/getent passwd`.each_line do |line|
  login, _passwd, uid, _gid, _gecos, home, _shell = line.force_encoding('UTF-8').split(':')
  next unless uid.to_i < 1000

  rsa_pub_key = "#{home}/.ssh/id_rsa.pub"
  next unless File.exist?(rsa_pub_key)

  Facter.add("#{login}_key") do
    File.read(rsa_pub_key)
  end
end
