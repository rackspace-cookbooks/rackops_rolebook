name             'rackops-rolebook'
maintainer       'Rackspace'
maintainer_email 'ryan.richard@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures rackops-rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.7'

depends "rackspace-user"
depends "motd"
depends "sudo"
depends "chef-client"
depends "ntp"
