#
# Cookbook Name:: modcloth-stingray-exec
# Recipe:: install
#
# Copyright 2013, ModCloth, Inc.
#

cookbook_file "#{node['install_prefix']}/bin/stingray-manage" do
  cookbook 'modcloth-stingray-exec'
  source 'stingray-manage'
  mode 0500
end
