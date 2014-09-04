#
# Cookbook Name:: rackops_rolebook
# Recipe:: default
#
# Copyright 2014, Rackspace, US Inc.
#

critical_recipes = %w(
  rackops_rolebook::motd
  rackops_rolebook::rack_user
  rackops_rolebook::ohai_plugins
  rackops_rolebook::public_info
  rackops_rolebook::acl
  platformstack::default
)

# Run critical recipes
critical_recipes.each do | recipe |
  include_recipe recipe
end

admin_packages = %w(
  sysstat
  dstat
  screen
  curl
  telnet
  traceroute
  mtr
  zip
  lsof
  strace
)

case node['platform_family']
when 'debian'
  admin_packages.push('vim')
  admin_packages.push('htop') # htop not available in cent/rhel w/o epel
  node.override['apt']['compile_time_update'] = true
  include_recipe 'apt'
when 'rhel'
  admin_packages.push('vim-minimal')
end

admin_packages.each do | admin_package |
  package admin_package do
    action :install
  end
end

# Set the default editor based on attribute
template 'editor-env-var' do
  cookbook node['rackops_rolebook']['templates']['editor-env-var']
  source 'editor.sh.erb'
  path '/etc/profile.d/editor.sh'
  owner 'root'
  group 'root'
  mode '00755'
  variables(
    cookbook_name: cookbook_name
  )
end
