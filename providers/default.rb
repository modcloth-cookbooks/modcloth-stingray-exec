%w(add_to_pool add_and_drain drain undrain disable enable).each do |axn|
  action axn.to_sym do
    run_context.include_recipe 'modcloth-stingray-exec::install'

    file '/root/.stingray.env' do
      content <<-EOB.gsub(/^ {6}/, '')
      export STINGRAY_AUTH='#{new_resource.auth}'
      export STINGRAY_ENDPOINT='#{new_resource.endpoint}'
      export STINGRAY_VERSION='#{new_resource.version}'
      if #{new_resource.ssl_verify_none} ; then
        export STINGRAY_SSL_VERIFY_NONE='1'
      fi
      #{new_resource.failure_file ? "export STINGRAY_FAILURE_FILE='#{new_resource.failure_file}'" : ''}
      EOB
      mode 0500
    end

    bash 'run action' do
      code "#{node['install_prefix']}/bin/stingray-manage #{axn} #{new_resource.pool} #{new_resource.node}"
      user 'root'
      group 'root'
      environment(
        {
          'STINGRAY_AUTH' => new_resource.auth,
          'STINGRAY_ENDPOINT' => new_resource.endpoint,
          'STINGRAY_VERSION' => new_resource.version,
        }.
        merge(new_resource.ssl_verify_none ? {'STINGRAY_SSL_VERIFY_NONE' => '1'} : {}).
        merge(new_resource.failure_file ? {'STINGRAY_FAILURE_FILE' => new_resource.failure_file} : {})
      )
    end

    new_resource.updated_by_last_action(true)
  end
end
