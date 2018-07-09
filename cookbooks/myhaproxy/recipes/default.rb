#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['haproxy']['members'] = [
{
 "hostname" => 'web1',
 "ipaddress" => '10.0.2.15',
 "port" => 80,
 "ssl_port" => 80,
}]

include_recipe "haproxy::manual"
