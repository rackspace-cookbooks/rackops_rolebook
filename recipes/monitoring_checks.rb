#
# Cookbook Name:: rackops_rolebook
# Recipe:: monitoring_checks
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# This recipe sets up standard checks but not alarms
# CPU, ram, load, disk usage, disk space, network usage

rackspace_cloudmonitoring_entity node['hostname'] do
  agent_id      node['rackspace_cloudmonitoring']['config']['agent']['id']
  search_method 'ip'
  search_ip     node['ipaddress']
  ip_addresses  ip: node['ipaddress']
end

rackspace_cloudmonitoring_check 'cpu' do
  entity_chef_label node['hostname']
  type              'agent.cpu'
end

rackspace_cloudmonitoring_check 'memory' do
  entity_chef_label node['hostname']
  type              'agent.memory'
end

rackspace_cloudmonitoring_check 'load_average' do
  entity_chef_label node['hostname']
  type              'agent.load_average'
end

# loop through all detected "filesystems"
node['filesystem'].each do |key, _data|

  # get block devices that start with "/"
  if key =~ /^\// # regex

    # Create disk checks for only these block devices
    rackspace_cloudmonitoring_check "filesystem-#{key}" do
      entity_chef_label node['hostname']
      type              'agent.disk'
      details            target: key
    end

    # Create a filesystem check for if block device mounted
    rackspace_cloudmonitoring_check "filesystem-#{node['filesystem'][key]['mount']}" do
      entity_chef_label node['hostname']
      type              'agent.filesystem'
      details            target: node['filesystem'][key]['mount']
      only_if { node['filesystem'][key]['mount'] } # if the block device is mounted
    end
  end
end

# Loop over all network "eth" interfaces and create check
node['network']['interfaces'].each do |key, data|
  rackspace_cloudmonitoring_check "network-#{key}" do
    entity_chef_label node['hostname']
    type              'agent.network'
    details           target: key
    only_if { data['type'] == 'eth' }
  end
end
