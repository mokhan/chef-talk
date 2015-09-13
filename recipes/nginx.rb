#resource
#- type
#- name
#- attributes
#- action

package "nginx"

template "/etc/nginx/sites-available/nginx.conf" do
  action :create
end

service "nginx" do
  action [:enable, :start]
end
