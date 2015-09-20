working_dir = "/var/www/#{node['chef-talk']['application_name']}"

directory working_dir do
  action :create
  recursive true
end

cookbook_file "#{working_dir}/config.ru"
cookbook_file "#{working_dir}/Procfile"

gem "rack"
gem "foreman"

include_recipe "runit" # same as runit::default

runit_service "foreman" do
  action [:enable, :start]
  default_logger true
  env node['chef-talk']['env']
  log true
  retries 3
end
