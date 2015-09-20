require 'spec_helper'

describe "chef-talk::ruby" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set["chef-talk"]["ruby_version"] = ruby_version
    end.converge(described_recipe)
  end

  let(:ruby_version) { "2.2.#{rand(3)}" }

  it 'installs rbenv' do
    expect(subject).to sync_git("/usr/local/rbenv")
  end

  it 'installs the specified version of ruby' do
    expect(subject).to install_ruby(ruby_version)
  end

  it 'makes the specified version the global ruby' do
    expect(subject).to globalize_ruby(ruby_version)
  end

  it 'exports the ruby path to PATH' do
    expect(subject).to create_cookbook_file("/etc/profile.d/rbenv.sh")
  end

  it 'creates the rbenv plugins directory' do
    expect(subject).to create_directory("/usr/local/rbenv/plugins")
  end

  it 'installs ruby-build' do
    expect(subject).to sync_git("/usr/local/rbenv/plugins/ruby-build").
      with(repository: "https://github.com/sstephenson/ruby-build.git")
  end
end
