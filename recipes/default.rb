#
# Cookbook:: lamp_centos7
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# Default packages and setup
package ['vim', 'cowsay', 'firewalld']

service 'firewalld' do
  action [:enable, :start]
end

execute 'firewall_ssh' do
  command '/usr/bin/firewall-cmd  --permanent --zone public --add-service ssh'
  ignore_failure true
end

service 'firewalld' do
  action [:restart]
end
