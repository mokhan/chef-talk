#resource
#- type
#- name
#- attributes
#- action

package "epel-release" if redhat?
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
