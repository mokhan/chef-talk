require 'spec_helper'

describe "chef-talk::nginx" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set['chef-talk']['application_name'] = domain
    end.converge(described_recipe)
  end
  let(:domain) { "www.blah#{rand(10)}.com" }

  it 'installs the nginx package' do
    expect(subject).to install_package("epel-release")
    expect(subject).to install_package("nginx")
  end

  it 'adds the configuration for our rails site' do
    expect(subject).to create_template("/etc/nginx/nginx.conf")
      .with(variables: { application_name: domain })
  end

  it 'starts nginx' do
    expect(subject).to start_service("nginx")
    expect(subject).to enable_service("nginx")
  end
end
