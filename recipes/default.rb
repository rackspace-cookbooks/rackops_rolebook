#
# Cookbook Name:: rackops-rolebook
# Recipe:: default
#
# Copyright 2013, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rackspace-user"
include_recipe "rackspace_motd"

# Including sudoers.d is done in recipe[rackspace-user]
sudo "rack" do
  user "rack"
  nopasswd true
end

include_recipe "chef-client"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client::config"
include_recipe "rackspace_ntp"

admin_packages = [
  "sysstat",
  "dstat",
  "screen",
  "curl",
  "telnet",
  "htop",
  "traceroute",
  "mtr",
  "zip"
]

case node['platform_family']
when "debian"
  admin_packages.push("vim")
when "rhel"
  admin_packages.push("vim-minimal")
end

admin_packages.each do | admin_package |
  package admin_package do
    action :install
  end
end

#Set the default editor based on attribute
file "/etc/profile.d/editor.sh" do
  owner "root"
  group "root"
  mode "755"
  content %{export EDITOR="#{node['editor']['default']}"}
end
