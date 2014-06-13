# Sets editor for profile.d

case node['platform_family']
when 'debian'
  default['rackops_rolebook']['editor']['default'] = '/usr/bin/vim.basic'
when 'rhel'
  default['rackops_rolebook']['editor']['default'] = '/bin/vi'
end
# set the template locations
default['rackops_rolebook']['templates']['editor-env-var'] = 'rackops_rolebook'
