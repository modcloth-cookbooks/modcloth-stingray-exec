describe 'modcloth-stingray-exec::install' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge described_recipe }
  let(:file) { '/usr/local/bin/stingray-manage' }

  it 'should install stingray-manage executable' do
    chef_run.template(file).action.should == 'create'
  end

  it 'should assign the correct permissions to the file' do
    chef_run.template(file).mode.should == 0500
  end
end
