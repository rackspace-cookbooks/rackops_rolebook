#
# Cookbook Name:: rackops_rolebook
# Recipe:: default
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

critical_recipes = %W[
  rackspace_user::rack_user
  rackspace_motd
  rackspace_ntp
]

if node['rackops_rolebook']['include_acl'] == true
  critical_recipes.push('rackops_rolebook::acl')
end

# Only include chef-client in client mode.
# This should allow for testing via solo
unless Chef::Config[:solo] == true
  critical_recipes.push('chef-client')
  critical_recipes.push('chef-client::delete_validation')
  critical_recipes.push('chef-client::config')
end

# Run critical recipes
critical_recipes.each do | recipe |
  include_recipe recipe
end

node.default['rackspace_sudo']['config']['authorization']['sudo']['include_sudoers_d'] = true

#needed because chef_client set up logrotate only if this is set to something...
node.default['chef-client']['log_file'] = '/var/log/chef/client.log'

rackspace_sudo 'rack' do
  user 'rack'
  nopasswd true
end

admin_packages = %W[
  sysstat
  dstat
  screen
  curl
  telnet
  traceroute
  mtr
  zip
  lsof
]

case node['platform_family']
when 'debian'
  admin_packages.push('vim')
  admin_packages.push('htop') # htop not available in cent/rhel w/o epel
when 'rhel'
  admin_packages.push('vim-minimal')
end

admin_packages.each do | admin_package |
  package admin_package do
    action :install
  end
end

# Set the default editor based on attribute
file '/etc/profile.d/editor.sh' do
  owner 'root'
  group 'root'
  mode '755'
  content %{export EDITOR="#{node['rackops_rolebook']['editor']['default']}"}
end
