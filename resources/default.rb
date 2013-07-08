actions :add_to_pool, :add_and_drain, :drain, :undrain, :disable, :enable

attribute :auth, kind_of: String, required: true
attribute :endpoint, kind_of: String, required: true
attribute :node, kind_of: String, required: true
attribute :pool, kind_of: String, required: true
attribute :ssl_verify_none, kind_of: String, default: nil
attribute :version, kind_of: String, default: '9.1'
attribute :failure_file, kind_of: String, default: nil

default_action :nothing
