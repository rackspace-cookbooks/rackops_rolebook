name             'rackops-rolebook'
maintainer       'Rackspace'
maintainer_email 'ryan.richard@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures rackops-rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

depends 'rackspace-user', '~> 0.1.18'
depends 'rackspace_motd', '~> 1.0'
depends 'sudo', '~> 2.2.1'
depends 'chef-client', '~> 3.2'
depends 'rackspace_ntp', '~> 2.0'
