require 'spec_helper'

describe "chef-talk::ruby" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set["chef-talk"]["ruby_version"] = ruby_version
    end.converge(described_recipe)
  end

  let(:ruby_version) { "2.2.#{rand(3)}" }

  it 'installs ruby-build' do
    expect(subject).to include_recipe("ruby_build")
  end

  it 'installs the specified version of ruby' do
    expect(subject).to install_ruby(ruby_version)
  end

  it 'exports the ruby path to PATH' do
    expect(subject).to create_template("/etc/profile.d/ruby.sh")
  end
end
