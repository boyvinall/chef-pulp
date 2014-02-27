#
# Cookbook Name:: pulp
# Recipe:: agent
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
# Pulp agent which will run as service and will accept commands.
#
include_recipe 'pulp::client'

%w{pulp-agent pulp-rpm-yumplugins pulp-rpm-handlers}.each do |pkg|
    package pkg do
        action :install
    end
end

directory '/etc/pulp/agent/' do
    recursive true
end

template '/etc/pulp/agent/agent.conf' do
    source 'agent.conf.erb'
    variables(
        :config => node['pulp']['agent']
    )
end

service 'pulp-agent' do
    action [ :enable, :start ]
end
