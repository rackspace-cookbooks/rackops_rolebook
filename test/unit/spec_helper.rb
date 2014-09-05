# Encoding: utf-8
require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'

::LOG_LEVEL = :fatal
::UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '12.04',
  log_level: ::LOG_LEVEL
}

::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}

def stub_resources
end

ChefSpec::Coverage.start!

RSpec.configure do |config|
  # Specify the operating platform to mock Ohai data from (default: nil)
  config.platform = 'ubuntu'
  # Specify the operating version to mock Ohai data from (default: nil)
  config.version = '12.04'
end

at_exit { ChefSpec::Coverage.report! }
