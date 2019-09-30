require 'facter'

if File.executable?('/usr/bin/getent')
  `/usr/bin/getent passwd`.each_line do |line|
    login, _passwd, _uid, _gid, _gecos, home, _shell = line.force_encoding('UTF-8').split(':')

    rsa_pub_key = "#{home}/.ssh/id_rsa.pub"
    next unless File.exist?(rsa_pub_key)

    Facter.add("#{login}_key") do
      setcode do
        File.read(rsa_pub_key)
      end
    end
  end
end
