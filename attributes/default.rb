default['chef-talk']['application_name'] = 'www.example.com'
default['chef-talk']['ruby_version'] = '2.2.3'

if node.platform_family == "rhel"
  default['chef-talk']['packages'] = %w{
    autoconf
    automake
    bison
    bzip2
    ca-certificates
    gcc-c++
    git
    libffi-devel
    libtool
    libxml2
    libxml2-devel
    libxslt
    libxslt-devel
    make
    openssl-devel
    patch
    readline
    readline-devel
    zlib
    zlib-devel
  }
else
  default['chef-talk']['packages'] = %w{
    build-essential
    curl
    git-core
    libcurl4-openssl-dev
    libffi-dev
    libreadline-dev
    libssl-dev
    libxml2-dev
    libxslt1-dev
    libyaml-dev
    python-software-properties
    zlib1g-dev
  }
end

default['chef-talk']['env']['RAILS_ENV'] = 'production'
