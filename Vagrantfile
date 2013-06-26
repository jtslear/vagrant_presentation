# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  if ENV['VAGRANT_DEFAULT_PROVIDER'] == 'vmware_fusion'
    config.vm.provider "vmware_fusion" do |fusion|
      #fusion.gui = true
      fusion.vmx["memsize"] = "368"
      fusion.vmx["usb.vbluetooth.startConnected"] = "FALSE"
      fusion.vmx["tools.syncTime"] = "FALSE"
      fusion.vmx["hard-disk.hostBuffer"] = "disabled"
      fusion.vmx["annotation"] = "Building a test server"
    end
    config.cache.auto_detect = true
    config.vm.define :web do |web|
      web.vm.box = "centos_base"
      web.vm.hostname = "testweb1"
      web.vm.network :forwarded_port, guest: 80, host: 8080
      web.vm.provision :chef_solo do |chef|
        chef.add_recipe "selinux::permissive"
        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_rewrite"
        chef.add_recipe "apache2::mod_proxy_http"
        chef.add_recipe "apache2::mod_proxy_balancer"
        chef.add_recipe "apache2::mod_proxy"
        chef.add_recipe "social"
      end
    end
    config.vm.define :db do |db|
      db.vm.box = "centos_base"
      db.vm.hostname = "testdb1"
      db.vm.provision :chef_solo do |chef|
        chef.add_recipe "selinux::permissive"
        chef.add_recipe "mysql::server"
        chef.json = {
          "mysql" => {
            "server_root_password" => "passwordsarestupid",
            "server_debian_password" => "passwordsarestupid",
            "server_repl_password" => "passwordsarestupid",
          },
        }
      end
    end
  end
end
