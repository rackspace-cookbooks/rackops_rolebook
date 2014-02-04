rackops-rolebook Cookbook
=========================
This "rolebook" is a replacement for a traditional role. It includes recipes like a role but is structured like a cookbook.

Requirements
------------
depends "rackspace-user"
depends "rackspace_motd"
depends "sudo"
depends "chef-client"
depends "rackspace_ntp"

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
