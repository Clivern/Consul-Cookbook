#
# Cookbook:: clivern-consul
# Recipe:: service
#
# Copyright:: 2018, Clivern, All Rights Reserved.


log "clivern-consul::recipe::service"


bash 'open-required-ports' do
    code <<-EOF
        ufw allow 8300
        ufw allow 8301
        ufw allow 8302
        ufw allow 8400
        ufw allow 8500
        ufw allow 8600
    EOF
end

directory "/tmp/consul_services" do
    owner "root"
    group "root"
    action :create
end

directory "/tmp/consul" do
    owner "root"
    group "root"
    action :create
end

if node['consul']['type'] == "leader"

    template '/etc/systemd/system/consul.service' do
        source 'systemctl/consul-server-leader.service.erb'
        owner "root"
        group "root"
        mode "0644"
        action :create
    end

elsif node['consul']['type'] == "server"

    template '/etc/systemd/system/consul.service' do
        source 'systemctl/consul-server.service.erb'
        owner "root"
        group "root"
        mode "0644"
        action :create
    end

elsif node['consul']['type'] == "client"

    template '/etc/systemd/system/consul.service' do
        source 'systemctl/consul-client.service.erb'
        owner "root"
        group "root"
        mode "0644"
        action :create
    end

end

bash 'restart-consul-service' do
    code <<-EOF
        systemctl stop consul.service
        systemctl daemon-reload
        systemctl start consul.service
    EOF
end

execute "check-consul-service-status" do
    command "systemctl status consul.service"
    live_stream true
end