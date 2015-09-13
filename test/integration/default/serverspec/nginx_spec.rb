require 'serverspec'

set :backend, :exec

describe "nginx" do
  it 'listens on port 81' do
    expect(port(81)).to be_listening
  end

  it 'runs the nginx service' do
    expect(service('nginx')).to be_running
  end
end
