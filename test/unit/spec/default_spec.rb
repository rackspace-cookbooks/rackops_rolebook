require_relative 'spec_helper'

critical_recipes = %w(
  rackops_rolebook::motd
  rackops_rolebook::rack_user
  rackops_rolebook::ohai_plugins
  rackops_rolebook::public_info
  rackops_rolebook::acl
  platformstack::default
)

admin_packages = %w(
  sysstat
  dstat
  screen
  curl
  telnet
  traceroute
  mtr
  zip
  lsof
  strace
  vim
  htop
)

describe 'rackops_rolebook::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['cpu']['total'] = 8
      node.set['public_info']['remote_ip'] = '127.0.0.1'
      stub_resources
    end.converge(described_recipe)
  end

  it "includes #{critical_recipes.join(',')}" do
    critical_recipes.each do |recipe|
      expect(chef_run).to include_recipe(recipe)
    end
  end

  it "installs package #{admin_packages.join(',')}" do
    admin_packages.each do |pkg|
      expect(chef_run).to install_package(pkg)
    end
  end
  
end
