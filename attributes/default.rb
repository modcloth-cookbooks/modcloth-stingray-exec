default['install_prefix'] = (
  {
    'solaris2' => '/opt/local',
    'smartos' => '/opt/local'
  }.fetch(node['platform'], '/usr/local')
)

default['stingray_exec']['version'] = '0.1.1'
