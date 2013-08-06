default['install_prefix'] = (
  {
    'solaris2' => '/opt/local',
    'smartos' => '/opt/local'
  }.fetch(node['platform'], '/usr/local')
)

default['stingray_exec']['version'] = '0.2.0'
default['stingray_exec']['gem_binary'] = 'gem'
default['stingray_exec']['ruby_interpreter'] = '/usr/bin/ruby'

if node['platform'] == 'ubuntu'
  default['stingray_exec']['ruby_interpreter'] = '/usr/bin/ruby1.9.3'
  if node['platform_version'] <= '12.04'
    default['stingray_exec']['gem_binary'] = 'gem1.9.3'
  end
end
