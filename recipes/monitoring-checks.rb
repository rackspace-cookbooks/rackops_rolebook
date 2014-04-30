#
# Cookbook Name:: rackops_rolebook
# Recipe:: monitoring-checks
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
  ip_addresses  { default: node['ipaddress'] }
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
node['filesystem'].each do |key,data|

  # get block devices that start with "/"
  if key =~ %r(^/) # regex

    # Create disk checks for only these block devices
    rackspace_cloudmonitoring_check "filesystem-#{key}" do
      entity_chef_label node['hostname']
      type              'agent.disk'
      target            key
    end

    # if the block device is mounted
    if node['filesystem'][key]['mount'] != nil

      # Create a filesystem check for that mount point
      rackspace_cloudmonitoring_check "filesystem-#{node['filesystem'][key]['mount']}" do
        entity_chef_label node['hostname']
        type              'agent.filesystem'
        target            node['filesystem'][key]['mount']
      end
    end
end

# Loop over all network "eth" interfaces and create check
node['network']['interfaces'].each do |key, data|
  if v['type'] == 'eth'
    rackspace_cloudmonitoring_check 'network-name' do
      entity_chef_label node['hostname']
      type              'agent.network'
      target            key
    end
  end
end
