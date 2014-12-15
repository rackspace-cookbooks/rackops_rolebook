require_relative 'spec_helper'

describe 'rackops_rolebook::public_info' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['cpu']['total'] = 8
      node.set['public_info']['remote_ip'] = '127.0.0.1'
    end.converge(described_recipe)
  end

  it 'installs the rest-client gem' do
    expect(chef_run).to install_chef_gem('rest-client')
  end

  it 'creates the directory for ohai plugins' do
    expect(chef_run).to create_directory('/etc/chef/ohai_plugins')
  end

  it 'renders a ohai plugin plugin_info.rb' do
    expect(chef_run).to render_file('/etc/chef/ohai_plugins/public_info.rb').with_content(/public_info/)
  end

  it 'reloads ohai' do
    expect(chef_run).to reload_ohai('reload_pubinfo')
  end
end
