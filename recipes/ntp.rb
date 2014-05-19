#
# Cookbook Name:: rackops_rolebook
# Recipe:: ntp
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

unless node['ntp']['servers'].size > 0
  node.set['ntp']['servers'] = %w(
    0.pool.ntp.org,
    1.pool.ntp.org,
    2.pool.ntp.org,
    3.pool.ntp.org,
    )
  log 'No NTP servers specified, using default ntp.org server pools'
end

include_recipe 'ntp'
