# CHANGELOG for rackops_rolebook

This file is used to list changes made in each version of rackops_rolebook.

## 2.0.0
* Remove the following cookbooks in favor of community cookbooks:
  * rackspace_user
  * rackspace_sudo
  * rackspace_ntp
  * rackspace_motd
  * rackspace_openssh
  * rackspace_apt
  * rackspace_yum
* Update versions of existing cookbooks
* Use LWRP for 'rack' user from user cookbook
* Use LWRP for 'rack' user from sudo cookbook for sudo access
* Set apt to run at compile time to build an apt cache on boot (Debian-based systems)
* Move motd template from rackspace_motd to this cookbook, using LWRP from 'motd-tail' cookbook to create
* Move ntp setup from rackspace_ntp to this cookbook, with time servers set via wrapper attribute

## 1.4.0
* Add public_info Ohai plugin to populate public_info attributes (https://github.com/rackops/rackops_rolebook/pull/14)

## 1.3.1
* Add Openssh dependency (https://github.com/rackops/rackops_rolebook/pull/11)

## 1.3.0
* Add Logrotation (https://github.com/rackops/rackops_rolebook/pull/9)

## 1.4.0
* Add public_info Ohai plugin to populate public_info attributes

## 1.2.0
* Add rackspace_cloudmonitoring as a dependency to enable standard checks

## 1.0.0
* new and improved (for varying values of improved)
* using more rackspace_blah cookbooks
* renamed to rackops_rolebook

## 0.3.0
* Add logic so that this cookbook is testable with chef-solo. Basically, do not include chef-client in solo mode
* Add rackspace_iptables support with standard allows for Rackspace

## 0.2.0:
* start convert over to rackspace cookbooks

## 0.1.0:
* Initial release of rackops-rolebook
