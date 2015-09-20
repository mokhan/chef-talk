require 'spec_helper'

describe "chef-talk::nginx" do
  subject do
    ChefSpec::SoloRunner.new(configuration) do |node|
      node.set['chef-talk']['application_name'] = application_name
    end.converge(described_recipe)
  end

  let(:application_name) { "www.example.com" }
  let(:configuration) { {} }

  it 'installs the nginx package' do
    expect(subject).to install_package("nginx")
  end

  it 'adds the configuration for our rails site' do
    expect(subject).to create_template("/etc/nginx/nginx.conf")
      .with(variables: { application_name: application_name })
  end

  it 'starts nginx' do
    expect(subject).to start_service("nginx")
    expect(subject).to enable_service("nginx")
  end

  it 'creates the nginx user' do
    expect(subject).to create_user("nginx")
  end

  context "centos" do
    let(:configuration) { { platform: 'centos', version: '6.6' } }

    it 'installs the extra packages for enterprise linux' do
      expect(subject).to install_package("epel-release")
    end
  end

  context "ubuntu" do
    let(:configuration) { { platform: 'ubuntu', version: '14.04' } }

    it 'does not install epel packages' do
      expect(subject).not_to install_package("epel-release")
    end
  end
end
