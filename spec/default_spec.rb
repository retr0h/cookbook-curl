require "chefspec"

describe "curl::default" do
  before do
    @chef_run = ::ChefSpec::ChefRunner.new.converge "curl::default"
  end

  it "installs package" do
    @chef_run.should upgrade_package "curl"
  end
end
