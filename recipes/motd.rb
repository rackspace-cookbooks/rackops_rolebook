#
# Cookbook Name:: rackops_rolebook
# Recipe:: motd
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'motd'

motd 'rack-motd' do
  cookbook 'rackops_rolebook'
  source 'motd.erb'
  color false
end