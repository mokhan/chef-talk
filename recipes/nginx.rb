#resource
#- type
#- name
#- attributes
#- action

package "epel-release"
package "nginx"

template "/etc/nginx/nginx.conf" do
  action :create
  variables(domain_name: node['chef-talk']['domain_name'])
  notifies :restart, 'service[nginx]'
end

service "nginx" do
  action [:enable, :start]
end
