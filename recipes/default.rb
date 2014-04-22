#
# Cookbook Name:: chef
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/etc/chef" do
  action :create
end

template "/etc/chef/solo.rb" do
  source "solo.rb.erb"
  owner "root"
  group "root"
  mode 0644
end
