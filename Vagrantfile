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
    config.vm.box = "centos_base"
    config.vm.hostname = "testweb1"
  end
end
