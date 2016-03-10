Vagrant.configure('2') do |config|
  config.vm.box = 'fedora/23-cloud-base'

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '.', '/vagrant/ansible-role-mythtv'

  config.vm.hostname = 'ansible-role-mythtv'

  config.vm.provision 'shell' do |s|
    s.keep_color = true
    s.path = 'tests/init.sh'
  end
end
