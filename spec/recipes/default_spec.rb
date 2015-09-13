require 'spec_helper'

describe "chef-talk::default" do
  subject do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs ruby' do
    expect(subject).to include_recipe('chef-talk::ruby')
  end

  it 'installs nginx' do
    expect(subject).to include_recipe('chef-talk::nginx')
  end

  it 'installs puma' do
    expect(subject).to include_recipe('chef-talk::puma')
  end
end
