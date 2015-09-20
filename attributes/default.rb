default['chef-talk']['application_name'] = 'www.example.com'
default['chef-talk']['ruby_version'] = '2.2.3'

default['chef-talk']['packages'] = %w{
  autoconf
  automake
  bison
  bzip2
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

default['chef-talk']['env']['RAILS_ENV'] = 'production'
