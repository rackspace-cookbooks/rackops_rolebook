#
# Cookbook Name:: rackops_rolebook
# Recipe:: user
#
# Copyright 2014, Rackspace, US Inc.
#

node.set['authorization']['sudo']['include_sudoers_d'] = true

include_recipe 'sudo'
include_recipe 'user'

remote_file "#{Chef::Config[:file_cache_path]}/authorized_keys" do
  source 'https://raw.github.com/rackops/authorized_keys/master/authorized_keys'
  owner 'root'
  group 'root'
  mode 0644
  use_conditional_get true
  use_etag true
  use_last_modified false
  notifies :create, 'ruby_block[put_auth_keys_into_array]', :immediately
end

ruby_block 'put_auth_keys_into_array' do
  block do
    key_array = []
    pattern = /^ssh-rsa/
    File.readlines("#{Chef::Config[:file_cache_path]}/authorized_keys").each do |line|
      if pattern =~ line
        key_array.push(line)
      end
    end
    ua = Chef::Resource::UserAccount.new('rack', run_context)
    ua.comment 'Rackspace User'
    ua.home '/home/rack'
    ua.ssh_keys key_array
    ua.run_action :create
  end
  action :nothing
end

sudo 'rack' do
  user 'rack'
  nopasswd true
end
