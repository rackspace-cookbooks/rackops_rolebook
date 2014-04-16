name             'rackops_rolebook'
maintainer       'Rackspace, US Inc.'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures rackops_rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'

depends 'chef-client',        '~> 3.3'
depends 'rackspace_user',     '~> 1.0'
depends 'rackspace_motd',     '~> 1.0'
depends 'rackspace_sudo',     '~> 3.1'
depends 'rackspace_ntp',      '~> 2.0'
depends 'rackspace_iptables', '~> 1.2'
