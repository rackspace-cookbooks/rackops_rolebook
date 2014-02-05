rackops-rolebook Cookbook
=========================
This "rolebook" is a replacement for a traditional base role. It includes recipes like a role but is structured like a cookbook.

Requirements
------------
depends "rackspace-user"
depends "rackspace_motd"
depends "sudo"
depends "chef-client"
depends "rackspace_ntp"
depends "rackspace_iptables"

Attributes
-----------
`default['rackops-rolebook']['editor']['default']` - sets the default editor for the entire machine via /etc/profile.d. Defaults to `vim`
`default['rackops-rolebook']['include_acl']` - Whether or not to include the standard Rackspace iptables ACLs for access. Default to `true`

Recipes
-------
`default.rb` - This recipe includes all the recipes from the required core cookbooks. It will include chef-client recipes if we are *not* running in chef_solo mode. It adds the `rack` user to the sudo group and installs a bunch of handy applications.

Usage
-----
#### rackops-rolebook::default
e.g.
Just include `rackops-rolebook` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rackops-rolebook]"
  ]
}
```

License and Authors
-------------------
Authors: ryan.richard@rackspace.com
