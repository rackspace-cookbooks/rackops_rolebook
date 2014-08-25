source 'https://api.berkshelf.com'
metadata

cookbook 'chef-client', git: 'git@github.com:opscode-cookbooks/chef-client.git'
cookbook 'rackspace_iptables', git: 'git@github.com:rackspace-cookbooks/rackspace_iptables.git'
cookbook 'rackspace_cloudbackup', git: 'git@github.com:rackspace-cookbooks/rackspace_cloudbackup.git'
cookbook 'rackspace_cloudmonitoring', git: 'git@github.com:rackspace-cookbooks/rackspace_cloudmonitoring.git'
cookbook 'logstash_stack', git: 'git@github.com:rackspace-cookbooks/logstash_stack.git'
cookbook 'platformstack', git: 'git@github.com:AutomationSupport/platformstack.git'
cookbook 'cron', git: 'git@github.com:rackspace-cookbooks/cron.git'

group :integration do
  cookbook 'apt'
  cookbook 'yum'
end
