working_dir = "/var/www/#{node['chef-talk']['domain_name']}"

directory working_dir do
  action :create
  recursive true
end

bash "install_rack" do
  code <<-EOH
    source /etc/profile.d/ruby.sh
    gem install rack --no-ri --no-rdoc
  EOH
end

cookbook_file "#{working_dir}/config.ru"

include_recipe "runit" # same as runit::default

runit_service "rackup" do
  action [:enable, :start]
  default_logger true
  env node['chef-talk']['env']
  log true
end
