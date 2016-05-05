#
# Cookbook Name:: rackops_rolebook
# Recipe:: public_info
#
# Populate public_info attributes via an ohai plugin
#
# Copyright 2014, Rackspace, US Inc.
#
include_recipe 'chef-sugar'

# ensure rest-client gem is available
chef_gem 'rest-client' do
  action :nothing
end.run_action(:install)

# Load the ohai recipe to populate node['ohai']
include_recipe 'ohai'

# Fail in a slightly more descriptive manner than the directory block below
#  if the plugin directory is unset.
if node['ohai'] && node['ohai']['plugin_path'].nil?
  raise 'ERROR: Ohai plugin path not set'
end

# Ensure the plugin directory exists
directory node['ohai']['plugin_path'] do
  owner 'root'
  group 'root'
  mode  '0755'
  recursive true
  action :nothing
end.run_action(:create)

cookbook_file "#{node['ohai']['plugin_path']}/public_info.rb" do
  owner 'root'
  group 'root'
  mode  '0644'
  action :nothing
end.run_action(:create)

ohai 'reload_pubinfo' do
  plugin 'public_info'
  action :nothing
end.run_action(:reload)

# Stop the run if the IP is invalid, assume failure here is preferable to running with invalid data
# This check is also important for testing: if the plugin fails to load and operate this exception will
#  halt convergance breaking Kitchen runs.
unless node.deep_fetch('public_info', 'remote_ip') =~ /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/
  raise "ERROR: Unable to determine server remote IP. (Got \"#{node['public_info']['remote_ip']}\") Halting to avoid use of bad data."
end

# Assign the external_ip tag to the node if node['public_info']['remote_ip'] looks like an IP.
tag("RemoteIP:#{node['public_info']['remote_ip']}")
