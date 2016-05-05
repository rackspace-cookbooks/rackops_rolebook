# Encoding: utf-8
require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'

require_relative 'support/matchers'

::LOG_LEVEL = :fatal
::UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '12.04',
  log_level: ::LOG_LEVEL
}.freeze

::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}.freeze

def stub_resources
  stub_command('which sudo').and_return('/usr/bin/sudo')
end

RSpec.configure do |config|
  # Specify the operating platform to mock Ohai data from (default: nil)
  config.platform = 'ubuntu'
  # Specify the operating version to mock Ohai data from (default: nil)
  config.version = '12.04'
end

at_exit { ChefSpec::Coverage.report! }
