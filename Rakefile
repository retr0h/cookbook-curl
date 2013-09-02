require "rake"

def cookbook_name
  require "chef/cookbook/metadata"

  metadata = Chef::Cookbook::Metadata.new
  metadata.from_file "metadata.rb"

  ENV['COOKBOOK_NAME'] = metadata.name
end

task :setup do
  sh "bundle install --path=.bundle/"
  sh "bundle exec berks install --path=.cookbooks/"
  cookbook_name
end

task :lint do
  sh "bundle exec foodcritic -f any .cookbooks/#{ENV['COOKBOOK_NAME']}"
end

task :unit do
  sh "bundle exec rspec .cookbooks/#{ENV['COOKBOOK_NAME']}/spec"
end

task :default => [:setup, :lint, :unit]
