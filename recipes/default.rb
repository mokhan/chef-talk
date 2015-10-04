if redhat?
  execute "yum update -y"
else
  execute "apt-get update -y"
end

package node['chef-talk']['packages']

include_recipe "chef-talk::ntpd"
include_recipe "chef-talk::nginx"
include_recipe "chef-talk::ruby"
include_recipe "chef-talk::foreman"
