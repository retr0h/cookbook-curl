name             "curl"
maintainer       "John Dewey"
maintainer_email "john@dewey.ws"
license          "Apache 2.0"
description      "Installs/Configures curl"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.1.1"

recipe           "curl", "Installs/Configures curl"

%w{ centos debian ubuntu windows }.each do |os|
  supports os
end
