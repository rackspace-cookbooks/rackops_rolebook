#
# Cookbook Name:: rackops-rolebook
# Recipe:: default
#
# Copyright 2013, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rackspace-user"

include_recipe "motd"

node.override['authorization']['sudo']['users'] = ["rack"]
node.override['authorization']['sudo']['passwordless'] = "true"
include_recipe "sudo"

include_recipe "chef-client"
include_recipe "chef-client::delete_validation"

include_recipe "ntp"

package "sysstat" do
	action :install
end

package "dstat" do
	action :install
end

package "htop" do
	action :install
end