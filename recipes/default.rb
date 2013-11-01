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
node.override['authorization']['sudo']['include_sudoers_d'] = true

include_recipe "sudo"

include_recipe "chef-client"
include_recipe "chef-client::delete_validation"

include_recipe "ntp"

admin_packages = [
  "sysstat",
  "dstat",
  "screen",
  "curl"
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
