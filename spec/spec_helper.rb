require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/deprecations'

::RHEL_OPTS = {
  platform: 'redhat',
  version: '7.4'
}.freeze
DEBIAN_OPTS = {
  platform: 'ubuntu',
  version: '16.04'
}.freeze
