#
# Cookbook Name:: rackops_rolebook
# Recipe:: motd
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'motd-tail'

motd_tail '/etc/motd' do
  template_source 'motd.erb'
end