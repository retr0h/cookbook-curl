require_relative 'spec_helper'

describe 'curl::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs package' do
    expect(chef_run).to upgrade_package 'curl'
  end
end
