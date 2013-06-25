service "iptables" do
  action [ :disable, :stop ]
end

package "ruby-devel" do
  action :install
end

wanted_gems = %w{ sinatra unicorn }
wanted_gems.each do |gem_list|
  gem_package gem_list do
    action :install
  end
end

app_dirs = %w{ config tmp tmp/sockets tmp/pids log }
app_dirs.each do |dir_name|
  directory "#{node['my_app']['path']}/#{dir_name}" do
    recursive true
    mode 0777
    action :create
  end
end

cookbook_file "#{node['my_app']['path']}/config.ru" do
  source "config.ru"
end
cookbook_file "#{node['my_app']['path']}/myapp.rb" do
  source "myapp.rb"
end
template "#{node['my_app']['path']}/config/unicorn.rb" do
  source "unicorn.rb.erb"
end
template "/etc/init.d/my_app" do
  source "myapp.erb"
  mode 0755
  owner "root"
  group "root"
end

#template "#{node['apache']['dir']}/sites-available/myapp.conf" do
#  source "myapp.conf.erb"
#end

web_app "my_app" do
  template "myapp.conf.erb"
  enable
end

#service "httpd" do
#  action [ :restart ]
#end

service "my_app" do
  action [ :start ]
end
