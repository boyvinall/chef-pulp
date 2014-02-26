#
# Cookbook Name:: pulp
# Recipe:: repository
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

# Version 2.x Production Releases
yum_repository 'pulp-v2-stable' do
    description 'Pulp v2 Production Releases'
    baseurl 'http://repos.fedorapeople.org/repos/pulp/pulp/stable/2/$releasever/$basearch/'
    skip_if_unavailable true
    gpgcheck false
end

# Version 2.x Beta Builds
yum_repository 'pulp-v2-beta' do
    description 'Pulp v2 Beta Builds'
    baseurl 'http://repos.fedorapeople.org/repos/pulp/pulp/beta/2.2/$releasever/$basearch/'
    skip_if_unavailable true
    gpgcheck false
    enabled node['pulp']['repo']['beta']
end

# Weekly Testing Builds
yum_repository 'pulp-v2-testing' do
    description 'Pulp v2 Testing Builds'
    baseurl 'http://repos.fedorapeople.org/repos/pulp/pulp/testing/$releasever/$basearch/'
    skip_if_unavailable true
    gpgcheck false
    enabled node['pulp']['repo']['testing']
end
