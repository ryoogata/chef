#
# Cookbook Name:: chef
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/etc/chef/ohai/hints" do
  action :create
  recursive true
end

template "/etc/chef/solo.rb" do
  source "solo.rb.erb"
  owner "root"
  group "root"
  mode 0644
end

%w{
  azure.json ec2.json gce.json rackspace.json
}.each do |file|
  cookbook_file "/etc/chef/ohai/hints/#{file}" do
    source "#{file}"
    not_if {File.exists?("/etc/chef/ohai/hints/#{file}")}
  end
end
