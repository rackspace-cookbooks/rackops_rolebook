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

# Ensure the plugin directory exists
plugin_directory = directory "#{node['ohai']['plugin_path']}" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
end

plugin_install = cookbook_file "#{node['ohai']['plugin_path']}/public_info.rb" do
  action :create
  owner "root"
  group "root"
  mode "0644"
end

reload_ohai = ohai "reload" do
  action :nothing
end

# Run during compile, not convergance
plugin_directory.run_action(:create)
plugin_install.run_action(:create)
reload_ohai.run_action(:reload)

# Assign the external_ip tag to the node
tag("ExternalIP:#{node['public_info']['remote_ip'] }")

