require 'spec_helper'

describe "chef-talk::nginx" do
  subject do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs the nginx package' do
    expect(subject).to install_package("nginx")
  end

  it 'adds the configuration for our rails site' do
    expect(subject).to create_template("/etc/nginx/sites-available/nginx.conf")
  end

  it 'starts nginx' do
    expect(subject).to start_service("nginx")
    expect(subject).to enable_service("nginx")
  end
end
