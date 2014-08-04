rackops_rolebook Cookbook
=========================
This "rolebook" is a set of recipes that enable Rackspace to support DevOps Automation customers.  Should a customer no longer want Rackspace support, we are able to remove this "rolebook" without impacting any other automation the customer may be using.

Requirements
------------
- depends "apt"
- depends "user"
- depends "motd-tail"
- depends "sudo"
- depends "rackspace_iptables"
- depends "ohai"
- depends "platformstack"

Attributes
-----------
- `default['rackops_rolebook']['editor']['default']` - sets the default editor for the entire machine via /etc/profile.d. Defaults to `vim`

Recipes
-------
`default.rb` - This recipe includes all the recipes from the required core cookbooks. It will include chef-client recipes if we are *not* running in chef_solo mode. It adds the `rack` user to the sudo group and installs a bunch of handy applications.
`acl.rb` - This recipe will the standard rackspace IPtables allows.
`motd.rb` - This recipe sets the motd useful to Rackspace support.
`public_info.rb` - This recipe sets a tag equal to the public IP detected on an external call.  This will assist Rackspace support in finding the correct IP to connect to via SSH
`rack_user.rb` - This recipe sets up the rack user, and pulls in the authorized_keys file with the public keys of various Rackspace support staff so that support can access the server for troubleshooting and remediation.

Usage
-----
#### rackops_rolebook::default
e.g.
Just include `rackops_rolebook` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rackops_rolebook]"
  ]
}
```

License and Authors
-------------------
Author: ryan.richard@rackspace.com
Author: matt.thode@rackspace.com
Author: jason.nelson@rackspace.com

## License
```
# Copyright 2014, Rackspace Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
```
