
# Sets editor for profile.d
default['rackops_rolebook']['editor']['default'] = '/usr/bin/vim.basic'

# Determines whether or not to include the standard rackspace iptables ACLs
default['rackops_rolebook']['include_acl'] = true

# Determines whether or not to set up standard cloud monitoring checks.
# Designed to be overriden in an environment
default['rackspace_cloudmonitoring']['standard_checks']['enabled'] = false

# set the template locations
default['rackops_rolebook']['templates']['editor-env-var'] = 'rackops_rolebook'
