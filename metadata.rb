name             'rackops-rolebook'
maintainer       'Rackspace'
maintainer_email 'ryan.richard@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures rackops-rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.8'

depends "rackspace-user", "~> 0.1.18"
depends "motd", "~> 0.1.1"
depends "sudo", "~> 2.2.1"
depends "chef-client", "~> 3.0.7"
depends "ntp", "~> 1.4.1"
