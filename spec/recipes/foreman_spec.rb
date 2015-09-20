require 'spec_helper'

describe "chef-talk::foreman" do
  subject do 
    ChefSpec::SoloRunner.new do |node|
      node.set['chef-talk']['application_name'] = application_name
    end.converge(described_recipe)
  end

  let(:working_dir) { "/var/www/#{application_name}" }
  let(:application_name) { "tweeter" }

  it 'creates the working directory' do
    expect(subject).to create_directory(working_dir)
  end

  it 'copies the Profile' do
    expect(subject).to create_cookbook_file("#{working_dir}/Procfile")
  end

  it 'installs the foreman gem' do
    expect(subject).to install_gem("foreman")
  end

  it 'installs runit' do
    expect(subject).to include_recipe("runit::default")
  end

  it 'starts the foreman service' do
    expect(subject).to start_runit_service("foreman")
    expect(subject).to enable_runit_service("foreman")
  end
end
