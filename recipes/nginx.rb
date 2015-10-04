if redhat?
  execute "yum upgrade -y ca-certificates"
  package "epel-release"
end

package "nginx"

user "nginx"

template "/etc/nginx/nginx.conf" do
  action :create
  variables(application_name: node['chef-talk']['application_name'])
  notifies :restart, 'service[nginx]'
end

service "nginx" do
  action [:enable, :start]
end
