require 'serverspec'

set :backend, :exec

describe "ruby" do
  def execute(shell_command)
    command("source /etc/profile.d/rbenv.sh && #{shell_command}")
  end

  it 'installs the default version of ruby' do
    expect(execute("ruby -v").stdout).to match(/2\.2\.3/)
  end

  it 'installs bundler' do
    expect(execute("which bundle").stdout).to match("/usr/local/rbenv/shims/bundle")
  end
end
