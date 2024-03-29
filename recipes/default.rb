#
# Cookbook Name:: tilestream
# Recipe:: default
#
# Copyright 2011, J.D. Hollis
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

include_recipe "nodejs"
include_recipe "nodejs::npm"

%w{libsqlite3-0 libsqlite3-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "Install Tilestream" do
  user "root"
  command "npm install -g tilestream"
  not_if "npm list -g | grep tilestream"
end

directory node[:tilestream][:tiles] do
  owner "root"
  group "root"
  mode 0755
  action :create
  recursive true
end

node[:tilestream][:tilesets].each { |url|
  filename = url.split('/').last
  remote_file "#{ node[:tilestream][:tiles] }/#{ filename }" do
    source url
    owner "root"
    group "root"
    action :create_if_missing
  end
}

service "tilestream" do
  supports :start => true, :stop => true, :restart => true
  start_command "NODE_ENV=production sudo tilestream start #{ start_options_helper_for(node) } &"
  stop_command "sudo killall tilestream"
  action :start
end
