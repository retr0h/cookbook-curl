name 'curl'
maintainer 'John Dewey'
maintainer_email 'john@dewey.ws'
source_url 'https://github.com/retr0h/cookbook-curl'
license 'Apache-2.0'
description 'Installs/Configures curl'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.4'
chef_version '>= 12.0'

recipe 'curl', 'Installs/Configures curl'
recipe 'libcurl', 'Install/Configure libcurl packages'

provides 'curl::libcurl'

supports 'centos'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'
