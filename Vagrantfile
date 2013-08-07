# vi: set ft=ruby :

$ubuntu_provision_script = <<-EOSHELL
export DEBIAN_FRONTEND=noninteractive
apt-get update -y -qq
apt-get install -y -qq ruby1.9.3 ruby1.9.1-full
EOSHELL

Vagrant.configure('2') do |config|
  config.vm.hostname = 'modcloth-stingray-exec-berkshelf'
  config.vm.box = 'canonical-ubuntu-12.04'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.network :private_network, ip: '33.33.33.10', auto_correct: true

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.berkshelf.enabled = true

  config.omnibus.chef_version = :latest

  config.vm.provision :shell, inline: $ubuntu_provision_script
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      'minitest-handler',
      'recipe[modcloth-stingray-exec::default]'
    ]
  end
end
