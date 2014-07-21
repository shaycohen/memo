# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box"

  $provScript = <<EOS
for SERVICE in crond iptables postfix
do
	service $SERVICE stop
	chkconfig $SERVICE off
done
EOS
 
  config.vm.provision "shell", inline: $provScript

  config.vm.provision :chef_client do |chef|
    chef.node_name = "acad360-app-vagtest"
    chef.delete_node = true
    chef.chef_server_url = "https://api.opscode.com/organizations/ac360"
    chef.validation_client_name = "ac360-validator"
    chef.validation_key_path = ".chef/ac360-validator.pem"
    chef.add_role "vagrant-tomcat"
    chef.add_role "war-deployer"
  end

# Change v.gui to 'true' for debug
  config.vm.provider "virtualbox" do |v|
    v.gui = false
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8009, host: 8009


end
