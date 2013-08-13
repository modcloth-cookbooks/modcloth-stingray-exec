require 'minitest/spec'

describe 'modcloth-stingray-exec::install' do
  include MiniTest::Chef::Assertions

  it 'installs the stingray-manage executable' do
    assert_sh 'which stingray-manage'
    assert_sh 'stingray-manage --help'
  end

  it 'installs the stingray-exec gem' do
    assert_sh 'which stingray-exec'
    assert_sh 'stingray-exec --help'
  end
end
