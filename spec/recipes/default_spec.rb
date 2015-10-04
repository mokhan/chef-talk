require 'spec_helper'

describe "chef-talk::default" do
  subject do
    ChefSpec::SoloRunner.new(configuration).converge(described_recipe)
  end

  let(:configuration) { {} }

  it 'installs ruby' do
    expect(subject).to include_recipe('chef-talk::ruby')
  end

  it 'installs nginx' do
    expect(subject).to include_recipe('chef-talk::nginx')
  end

  it 'installs foreman' do
    expect(subject).to include_recipe('chef-talk::foreman')
  end

  it 'installs ntpd' do
    expect(subject).to include_recipe('chef-talk::ntpd')
  end

  context 'centos' do
    let(:configuration) { { platform: 'centos', version: '6.6' } }

    it 'updates the package index' do
      expect(subject).to run_execute('yum update -y')
    end
  end

  context 'ubuntu' do
    let(:configuration) { { platform: 'ubuntu', version: '14.04' } }

    it 'updates the package index' do
      expect(subject).to run_execute('apt-get update -y')
    end
  end
end
