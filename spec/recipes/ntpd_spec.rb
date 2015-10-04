require 'spec_helper'

describe "chef-talk::ntpd" do
  subject do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs ntpd' do
    expect(subject).to install_package('ntp')
  end

  it 'starts ntpd' do
    expect(subject).to start_service('ntpd')
    expect(subject).to enable_service('ntpd')
  end
end
