#
# Cookbook Name:: rackops_rolebook
# Recipe:: public_info
#
# Populate public_info attributes via an ohai plugin
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# Load the ohai recipe to populate node['ohai']
include_recipe 'ohai'

# Fail in a slightly more descriptive manner than the directory block below
#  if the plugin directory is unset.
if node['ohai']['plugin_path'].nil?
  fail 'ERROR: Ohai plugin path not set'
end

# Ensure the plugin directory exists
plugin_directory = directory node['ohai']['plugin_path'] do
  owner 'root'
  group 'root'
  mode  '0755'
  recursive true
end

plugin_install = cookbook_file "#{node['ohai']['plugin_path']}/public_info.rb" do
  action :create
  owner 'root'
  group 'root'
  mode  '0644'
end

reload_ohai = ohai 'reload' do
  action :nothing
end

# Run during compile, not convergance
plugin_directory.run_action(:create)
plugin_install.run_action(:create)
reload_ohai.run_action(:reload)

# Stop the run if the IP is invalid, assume failure here is preferable to running with invalid data
unless node['public_info']['remote_ip'] =~ /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/
  fail "ERROR: Unable to determine server remote IP. (Got \"#{node['public_info']['remote_ip']}\") Halting to avoid use of bad data."
end
  
# Assign the external_ip tag to the node if node['public_info']['remote_ip'] looks like an IP.
tag("RemoteIP:#{node['public_info']['remote_ip']}")
