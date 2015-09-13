def install_ruby(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:ruby_build_ruby, :install, resource_name)
end
