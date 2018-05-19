#
# Cookbook:: clivern-consul
# Attributes:: default
#
# Copyright:: 2018, Clivern, All Rights Reserved.

default['consul']['update'] = true
default['consul']['download_url'] = "https://releases.hashicorp.com/consul/1.1.0/consul_1.1.0_linux_amd64.zip"
default['consul']['node_fqdn'] = "127.0.0.1"
default['consul']['leader_fqdn'] = "127.0.0.1"
default['consul']['type'] = "leader" # server or leader or client
default['consul']['datacenter'] = "dc1"