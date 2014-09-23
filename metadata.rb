name             'rackops_rolebook'
maintainer       'Rackspace, US Inc.'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures rackops_rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version          '3.1.4'

depends 'apt', '>= 2.4'
depends 'git'
depends 'motd-tail', '>= 2.0'
depends 'ohai', '>= 2.0'
depends 'platformstack', '>= 0.1.1'
depends 'rackspace_iptables', '>= 1.2'
depends 'sudo', '>= 2.6'
depends 'user', '>= 0.3'
