require_relative 'spec_helper'

describe 'rackops_rolebook::motd' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['cpu']['total'] = 8
      node.set['public_info']['remote_ip'] = '127.0.0.1'
    end.converge(described_recipe)
  end

  it 'includes motd-tail' do
    expect(chef_run).to include_recipe('motd-tail')
  end

  it 'create motd_tail resource' do
    expect(chef_run).to create_motd_tail('/etc/motd.tail')
  end

end
