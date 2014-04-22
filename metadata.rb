name             'chef'
maintainer       'Ryo Ogata'
maintainer_email 'ryo.ogata@gmail.com'
license          'All rights reserved'
description      'Installs/Configures chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# == Attributes
#
attribute "chef",
    :display_name => "General chef Options",
    :type => "hash"


attribute "chef/_FILE_CACHE_PATH",
  :display_name => "",
  :description =>
    "",
  :default => "/tmp",
  :required => "optional",
  :recipes => ["chef::default"]

attribute "chef/_COOKBOOK_PATH",
  :display_name => "",
  :description =>
    "",
  :default => "['/vagrant/chef-repo/cookbooks', '/vagrant/chef-repo/site-cookbooks']",
  :required => "optional",
  :recipes => ["chef::default"]

attribute "chef/_ROLE_PATH",
  :display_name => "",
  :description =>
    "",
  :default => "/vagrant/chef-repo/roles",
  :required => "optional",
  :recipes => ["chef::default"]

attribute "chef/_DATABAG_PATH",
  :display_name => "",
  :description =>
    "",
  :default => "/vagrant/chef-repo/data_bags",
  :required => "optional",
  :recipes => ["chef::default"]
