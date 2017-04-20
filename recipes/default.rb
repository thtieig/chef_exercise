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

execute 'firewall_ssh' do
  command '/usr/bin/firewall-cmd  --permanent --zone public --add-service ssh'
  ignore_failure true
end

execute 'firewall_http' do
  command '/usr/bin/firewall-cmd  --permanent --zone public --add-service http'
  ignore_failure true
end

execute 'firewall_https' do
  command '/usr/bin/firewall-cmd  --permanent --zone public --add-service https'
  ignore_failure true
end

service 'firewalld' do
  action [:restart]
end


# Database setup
package ['mariadb-server', 'mariadb']

service 'mariadb' do
  action [:enable, :start]
end

# 'phpmyadmin'
