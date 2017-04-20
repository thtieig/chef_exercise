#
# Cookbook:: lamp_centos7
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# Apache/PHP setup
package ['httpd', 'php', 'php-xml', 'php-pear', 'php-gd', 'php-cli', 'php-soap', 'php-pdo', 'php-mysql']

service 'httpd' do
  action [:enable, :start]
end

template '/var/www/html/index.php' do
  source 'index.php.erb'
  mode "0644"
end

# Firewall setup
package 'firewalld'

service 'firewalld' do
  action [:enable, :start]
end

firewalld_service 'http' do
    action :add
    zone   'public'
end

firewalld_service 'https' do
    action :add
    zone   'public'
end

firewalld_service 'ssh' do
    action :add
    zone   'public'
end

service 'firewalld' do
  action [:restart]
end




# Database setup
package ['mariadb-server', 'mariadb']

service 'mariadb' do
  action [:enable, :start]
end
