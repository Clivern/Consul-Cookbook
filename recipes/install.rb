#
# Cookbook:: clivern-consul
# Recipe:: install
#
# Copyright:: 2018, Clivern, All Rights Reserved.


log "clivern-consul::recipe::install"

execute "apt-get update" do
    command "apt-get update"
    live_stream true
    only_if { node['consul']['update'] }
end

package "unzip" do
    action :install
end

bash 'download-consul' do
    code <<-EOF
        cd /usr/local/bin
        wget #{node['consul']['download_url']}
        unzip *.zip
        rm *.zip
    EOF
    not_if { ::File.exist?("/usr/local/bin/consul") }
end