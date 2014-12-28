#
# Cookbook Name:: ud-wpad
# Recipe:: default
#
# Copyright 2014, Urbandecoder Labs LLC
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

include_recipe 'ud-httpserver'

cookbook_file '/etc/httpd/conf.d/wpad.conf' do
  owner 'root'
  group node['root_group']
  mode 00644
  action :create
  notifies :reload, 'httpd_service[default]'
end

cookbook_file '/var/www/html/wpad.dat' do
  owner 'root'
  group node['root_group']
  mode 00644
  action :create
end
