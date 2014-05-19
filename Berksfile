source 'https://api.berkshelf.com'
metadata

cookbook 'chef-client', github: 'opscode-cookbooks/chef-client'
cookbook 'rackspace_iptables', github: 'rackspace-cookbooks/rackspace_iptables'
cookbook 'rackspace_cloudmonitoring', github: 'rackspace-cookbooks/rackspace_cloudmonitoring'

group :integration do
  cookbook 'apt'
  cookbook 'yum'
end
