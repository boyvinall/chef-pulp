#
# Cookbook Name:: pulp
# Recipe:: server
#
# Copyright 2014, Marius Karnauskas
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
# Pulp service which will provide repositories, etc.
#
%w{pulp-server pulp-rpm-plugins}.each do |pkg|
    package pkg do
        action [ :install ]
    end
end

directory '/etc/pulp/logging' do
    recursive true
    not_if { ::File.directory?('/etc/pulp/logging') }
end

directory '/etc/pulp/server/plugins.conf.d' do
    recursive true
    not_if { ::File.directory?('/etc/pulp/server/plugins.conf.d') }
end

template '/etc/pulp/server.conf' do
    source 'server.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
end

httpd_service 'default' do
  action [:create, :start]
end

httpd_module 'wsgi' do
  action :create
end

httpd_config 'ssl' do
  source 'ssl.conf.erb'
  notifies :restart, 'httpd_service[default]'
  action :create
end

httpd_config 'pulp' do
  source 'pulp.conf.erb'
  notifies :restart, 'httpd_service[default]'
  action :create
end

httpd_config 'pulp_rpm' do
  source 'pulp_rpm.conf.erb'
  notifies :restart, 'httpd_service[default]'
  action :create
end

execute 'chown /var/lib/pulp/published' do
	command 'for r in http https yum; do mkdir -p /var/lib/pulp/published/$r/repos ; done ; chown -R apache:apache /var/lib/pulp/published'
	only_if "find /var/lib/pulp/published -user root -type d | grep /var/lib/pulp/published"
end

execute 'setup-db' do
    command 'pulp-manage-db'
    user 'apache'
    notifies :restart, 'httpd_service[default]'
end
