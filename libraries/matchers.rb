if defined?(ChefSpec)
  def install_ruby(ruby_version)
    rbenv("install #{ruby_version}")
  end

  def globalize_ruby(ruby_version)
    rbenv("global #{ruby_version}")
  end

  def install_gem(gem_name)
    ChefSpec::Matchers::ResourceMatcher.new(:chef_talk_gem, :install, gem_name)
  end

  private

  def rbenv(command)
    ChefSpec::Matchers::ResourceMatcher.new(:chef_talk_rbenv, :run, command)
  end
end
