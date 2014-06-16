#
# Cookbook Name:: chef
# Recipe:: setup_chefdk
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node['platform']
when "centos", "amazon"
  remote_file "#{node['chef']['_PACKAGE_DOWNLOAD_DIR']}/chefdk.rpm" do
    source "https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.1.0-1.el6.x86_64.rpm"
    not_if {File.exists?("#{node['chef']['_PACKAGE_DOWNLOAD_DIR']}/chefdk.rpm")}
  end
end

case node['platform']
when "centos", "amazon"
  package "chefdk" do
    action :install
    source "#{node['chef']['_PACKAGE_DOWNLOAD_DIR']}/chefdk.rpm"
    provider Chef::Provider::Package::Rpm
  end
end

%w{
  knife-solo knife-solo_data_bag
}.each do |package_name|
    gem_package package_name do
      action :install
      gem_binary("/opt/chefdk/embedded/bin/gem")
      options("--no-rdoc --no-ri --install-dir /opt/chefdk/embedded/lib/ruby/gems/2.1.0")
    end
end

%w{
  chef-zero ohai
}.each do |link|
    link "/usr/bin/#{link}" do
      to "/opt/chef/bin/#{link}"
    end
end
