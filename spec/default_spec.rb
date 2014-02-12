# encoding: UTF-8

require_relative 'spec_helper'

describe 'curl::default' do
  before do
    @chef_run = ChefSpec::Runner.new.converge 'curl::default'
  end

  it 'installs package' do
    @chef_run.should upgrade_package 'curl'
  end
end
