# Encoding: utf-8
require 'serverspec'

set :backend, :exec

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/bin:/usr/bin:/usr/sbin'
  end
end
