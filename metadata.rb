name             'rackops_rolebook'
maintainer       'Rackspace'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures rackops_rolebook'
source_url 'https://github.com/rackspace-cookbooks/rackops_rolebook' if respond_to?(:source_url)
issues_url 'https://github.com/rackspace-cookbooks/rackops_rolebook/issues' if respond_to?(:issues_url)
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version          '3.2.1'

depends 'apt', '~> 2.6'
depends 'git'
depends 'motd-tail', '~> 2.0'
depends 'ohai', '~> 2.0'
depends 'platformstack', '~> 1.5'
depends 'rackspace_iptables', '~> 1.7'
depends 'sudo', '~> 2.7'
depends 'user', '~> 0.3'
depends 'chef-sugar'
