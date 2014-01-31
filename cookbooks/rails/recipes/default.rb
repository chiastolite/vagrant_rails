#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

rbenv_ruby "2.1.0" do
  ruby_version "2.1.0"
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.1.0"
end

case node[:rails][:database]
when 'mysql'
  package 'mysql'
when 'postgresql'
  package 'postgresql'
else
  log node[:rails][:database]
end

