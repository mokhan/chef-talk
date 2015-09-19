working_dir = "/var/www/#{node['chef-talk']['domain_name']}"

directory working_dir do
  action :create
  recursive true
end

cookbook_file "#{working_dir}/config.ru"
cookbook_file "#{working_dir}/Procfile"

bash "install_foreman" do
  code <<-EOH
    source /etc/profile.d/ruby.sh
    gem install rack foreman --no-ri --no-rdoc
  EOH
end

include_recipe "runit" # same as runit::default

runit_service "foreman" do
  action [:enable, :start]
  default_logger true
  env node['chef-talk']['env']
  log true
end
