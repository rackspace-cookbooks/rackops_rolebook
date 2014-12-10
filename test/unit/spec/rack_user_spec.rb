require_relative 'spec_helper'

describe 'rackops_rolebook::rack_user' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['cpu']['total'] = 8
      node.set['public_info']['remote_ip'] = '127.0.0.1'
      stub_resources
    end.converge(described_recipe)
  end

  it 'includes sudo and user' do
    %w(sudo user).each do |recipe|
      expect(chef_run).to include_recipe(recipe)
    end
  end

  it 'downloads authorized_keys file' do
    expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/authorized_keys")
  end

  it 'adds rack user to sudo' do
    expect(chef_run).to install_sudo('rack')
  end
end
