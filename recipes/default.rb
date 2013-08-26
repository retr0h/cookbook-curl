#
# Cookbook Name:: curl
# Recipe:: default
#
# Copyright 2012-2013, John Dewey, Lucas Hansen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


unless platform? "windows"
  package "curl" do
    action :upgrade
  end
else

  windows_zipfile "#{Chef::Config[:file_cache_path]}/extracted_curl" do
    action :unzip
    source node["curl"]["windows"]["url"]
    not_if { ::File.exists?(node["curl"]["windows"]["dir"]) }
  end

  node["curl"]["windows"]["url"].split("/").last[/(.*)\.zip/]
  cached_curl_dir = "#{Chef::Config[:file_cache_path]}/extracted_curl/#{$1}".gsub("/", "\\")
  curl_dir = node["curl"]["windows"]["dir"].gsub("/", "\\")
  
  execute "xcopy /E /i #{cached_curl_dir} #{curl_dir}" do
    action :run
    not_if { ::File.exists?(node["curl"]["windows"]["dir"]) }
  end

  remote_file "#{node["curl"]["windows"]["dir"]}/curl-ca-bundle.crt" do
    source node["curl"]["windows"]["certificate"]
  end
  
  ENV['PATH'] += ";#{node['curl']["windows"]['dir']}"
  windows_path node['curl']["windows"]['dir']

end  
