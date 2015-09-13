include_recipe "ruby_build"

package node['chef-talk']['packages']

ruby_version = node["chef-talk"]["ruby_version"]

ruby_build_ruby ruby_version do
  action :install
end

template "/etc/profile.d/ruby.sh"

bash "install_bundler" do
  code <<-EOH
    source /etc/profile.d/ruby.sh
    gem install bundler --no-ri --no-rdoc
  EOH
end
