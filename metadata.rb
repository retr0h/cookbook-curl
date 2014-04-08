name 'curl'
maintainer 'John Dewey'
maintainer_email 'john@dewey.ws'
license 'Apache 2.0'
description 'Installs/Configures curl'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'

recipe 'curl', 'Installs/Configures curl'
recipe 'libcurl', 'Install/Configure libcurl packages'

supports 'centos'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'
