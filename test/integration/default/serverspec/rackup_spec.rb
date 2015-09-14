require 'serverspec'

set :backend, :exec

describe "rackup" do
  it 'starts the rack service' do
    expect(port(9292)).to be_listening
  end
end
