git "/usr/local/rbenv" do
  repository "https://github.com/sstephenson/rbenv.git"
  action :sync
end

cookbook_file "/etc/profile.d/rbenv.sh"
directory "/usr/local/rbenv/plugins"

git "/usr/local/rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
  action :sync
end

ruby_version = node["chef-talk"]["ruby_version"]
chef_talk_rbenv "install #{ruby_version}" do
  not_if { ::File.exist?("/usr/local/rbenv/versions/#{ruby_version}") }
end
rbenv "global #{ruby_version}"

gem "bundler"
