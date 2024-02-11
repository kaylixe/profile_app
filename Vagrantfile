#Installs Docker and Docker Compose in ubuntu

Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true
  
## DB vm  ####
  config.vm.define "dockerengine" do |dockerengine|
    dockerengine.vm.box = "ubuntu/bionic64"
    dockerengine.vm.hostname = "dockerengine"
    dockerengine.vm.network "private_network", ip: "192.168.56.27"
    dockerengine.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "4000"
    end
      dockerengine.vm.provision "shell", path:"docker_install.sh"
  end 
end
