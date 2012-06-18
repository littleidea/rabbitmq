#
# Cookbook Name:: rabbitmq
# Recipe:: monitoring
#
# Copyright 2012, Rackspace Hosting, Inc.
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

########################################
# BEGIN MONIT SECTION
# Allow for enable/disable of monit
if node["enable_monit"]
  include_recipe "monit::server"
  monit_commands = node["rabbitmq"]["platform"]["monit_commands"]["rabbitmq-server"]

  monit_procmon "rabbitmq-server" do
    process_name "rabbitmq-server"
    start_cmd monit_commands["start"]
    stop_cmd monit_commands["stop"]
  end
end
########################################

########################################
# BEGIN COLLECTD SECTION
# Allow for enable/disable of collectd
if node["enable_collectd"]
  include_recipe "collectd-graphite::collectd-client"
  include_recipe "collectd-plugins::rabbitmq"
end
########################################
