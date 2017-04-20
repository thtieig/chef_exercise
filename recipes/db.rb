#
# Cookbook:: lamp_centos7
# Recipe:: db
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# Database setup
package ['mariadb-server', 'mariadb']

service 'mariadb' do
  action [:enable, :start]
end
