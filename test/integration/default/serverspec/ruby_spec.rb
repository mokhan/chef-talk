require 'serverspec'

set :backend, :exec

describe "ruby" do
  def execute(shell_command)
    command("source /etc/profile.d/ruby.sh && #{shell_command}")
  end

  it 'installs the default version of ruby' do
    expect(execute("ruby -v").stdout).to match(/2\.2\.3/)
  end

  it 'installs bundler' do
    expect(execute("which bundle").stdout).to match("/usr/local/ruby/2.2.3/bin/bundle")
  end
end
