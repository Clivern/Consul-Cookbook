#
# Cookbook:: clivern-consul
# Recipe:: default
#
# Copyright:: 2018, Clivern, All Rights Reserved.

include_recipe 'clivern-consul::install'
include_recipe 'clivern-consul::service'