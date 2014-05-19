#
# Cookbook Name:: rackops_rolebook
# Recipe:: user
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'user'

user_account 'rack' do
  comment   'Rackspace User'
  home      '/home/rack'
end

remote_file '/home/rack/.ssh/authorized_keys' do
  source 'https://raw.github.com/rackops/authorized_keys/master/authorized_keys'
  owner 'rack'
  group 'rack'
  mode 0644
end

sudo 'rack' do
  user 'rack'
  nopasswd true
end