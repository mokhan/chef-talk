require 'serverspec'

set :backend, :exec

describe "nginx" do
  it 'listens on port 80' do
    expect(port(80)).to be_listening
  end

  it 'runs the nginx service' do
    expect(service('nginx')).to be_running
  end
end
