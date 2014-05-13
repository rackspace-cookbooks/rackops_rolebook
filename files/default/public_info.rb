# available at https://github.com/rackops/public_info
#
# Author:: Thomas Cate (thomas.cate@rackspace.com)
# Copyright:: Copyright (c) 2014 Rackspace, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

provides 'public_info'

require 'json'
require 'rest-client'

url = 'http://whoami.rackops.org/api'

begin
  response = RestClient.get(url)
  results = JSON.parse(response)

  unless results.nil?
    public_info Mash.new
    public_info[:remote_ip] = results['remote_ip']
    public_info[:X_Forwarded] = results['X_Forwarded']
    public_info[:asn] = results['asn']
    public_info[:city] = results['city']
    public_info[:country] = results['country']
  end

rescue RestClient::Exception
  Ohai::Log.debug('Failed to return info from whoami.rackops.org')
end
