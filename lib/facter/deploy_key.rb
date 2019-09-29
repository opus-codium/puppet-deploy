require 'facter'

if File.executable?('/usr/bin/getent')
  ssh_user_public_keys = {}

  `/usr/bin/getent passwd`.each_line do |line|
    login, _passwd, _uid, _gid, _gecos, home, _shell = line.force_encoding('UTF-8').split(':')

    keys = Dir["#{home}/.ssh/*.pub"].map do |filename|
      File.read(filename)
    end

    next if keys.empty?

    ssh_user_public_keys[login] = keys
  end

  unless ssh_user_public_keys.empty?
    Facter.add('ssh_user_public_keys') do
      setcode do
        ssh_user_public_keys
      end
    end
  end
end
