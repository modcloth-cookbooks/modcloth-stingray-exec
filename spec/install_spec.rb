describe 'modcloth-stingray-exec::install' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge described_recipe }
  let(:file) { '/usr/local/bin/stingray-manage' }

  it 'should install stingray-manage executable' do
    chef_run.should create_cookbook_file file
  end

  it 'should assign the correct permissions to the file' do
    chef_run.cookbook_file(file).mode.should == 0500
  end
end
