#
# Cookbook Name:: rackops_rolebook
# Recipe:: ohai_plugins
#
# Populate public_info attributes via an ohai plugin
#
# Copyright 2014, Rackspace, US Inc.
#

# Load the ohai recipe to populate node['ohai']
include_recipe 'ohai'
include_recipe 'git'

# Fail in a slightly more descriptive manner than the directory block below
#  if the plugin directory is unset.
if node['ohai']['plugin_path'].nil?
  fail 'ERROR: Ohai plugin path not set'
end

# Ensure the plugin directory exists
directory node['ohai']['plugin_path'] do
  owner 'root'
  group 'root'
  mode  '0755'
  recursive true
end

git "#{Chef::Config['file_cache_path']}/ohai_plugins" do
  repository node['rackops_rolebook']['ohai_plugins']['repo']
  reference node['rackops_rolebook']['ohai_plugins']['ref']
  action :sync
end

Dir["#{Chef::Config['file_cache_path']}/ohai_plugins/plugins/*"].each do |plugin|
  remote_file "#{node['ohai']['plugin_path']}/#{File.basename(plugin)}" do
    source "file://#{plugin}"
    owner 'root'
    group 'root'
    mode '0644'
  end
end

ohai 'reload' do
  action :reload
end
