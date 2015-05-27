default['pulp']['repo']['beta'] = false
default['pulp']['repo']['testing'] = false

default['pulp']['server'] = {
    'run_init_db' => true
}

default['pulp']['admin'] = {
    'server' => {
        'host' => "pulp.#{node['domain']}",
        'port' => 443,
        'api_prefix' => '/pulp/api',
        'upload_chunk_size' => 1048576
    },
    'client' => {
        'role' => 'admin'
    },
    'filesystem' => {
        'extensions_dir' => '/usr/lib/pulp/admin/extensions',
        'id_cert_dir' => '~/.pulp',
        'id_cert_filename' => 'user-cert.pem',
        'upload_working_dir' => '~/.pulp/uploads'
    },
    'logging' => {
        'filename' => '~/.pulp/admin.log',
        'call_log_filename' => '~/.pulp/server_calls.log'
    },
    'output' => {
        'poll_frequency_in_seconds' => 1,
        'enable_color' => 'true',
        'wrap_to_terminal' => 'false',
        'wrap_width' => 80,
    }
}

default['pulp']['agent'] = {
}

default['pulp']['client'] = {
    'server' => {
        'host' => "pulp.#{node['domain']}",
        'port' => 443,
        'api_prefix' => '/pulp/api'
    },
    'client' => {
        'role' => 'consumer'
    },
    'filesystem' => {
        'extensions_dir' => '/usr/lib/pulp/consumer/extensions',
        'repo_file' => '/etc/yum.repos.d/pulp.repo',
        'mirror_list_dir' => '/etc/yum.repos.d',
        'gpg_keys_dir' => '/etc/pki/pulp-gpg-keys',
        'cert_dir' => '/etc/pki/pulp/client/repo',
        'id_cert_dir' => '/etc/pki/pulp/consumer/',
        'id_cert_filename' => 'consumer-cert.pem'
    },
    'reboot' => {
        'permit' => 'False',
        'delay' => 3
    },
    'logging' => {
        'filename' => '~/.pulp/consumer.log',
        'call_log_filename' => '~/.pulp/consumer_server_calls.log',
    },
    'output' => {
        'poll_frequency_in_seconds' => 1,
        'enable_color' => 'true',
        'wrap_to_terminal' => 'false',
        'wrap_width' => 80,
    },
    'messaging' => {
        'scheme' => 'tcp',
        'port' => 5672,
        'cacert' => '',
        'clientcert' => '/etc/pki/pulp/consumer/consumer-cert.pem'
    },
    'heartbeat' => {
        'seconds' => 10,
    }

}

default['pulp']['repositories'] = []

default['pulp']['ssl']['conf']['SSLCertificateFile'] = '/etc/pki/tls/certs/localhost.crt'
default['pulp']['ssl']['conf']['SSLCertificateKeyFile'] = '/etc/pki/tls/private/localhost.key'

default['pulp']['server']['conf']['database']['name'] = 'pulp_database'
default['pulp']['server']['conf']['database']['seeds'] = 'localhost:27017'
default['pulp']['server']['conf']['database']['operation_retries'] = 2
#default['pulp']['server']['conf']['database']['replica_set'] = 'replica_set_name'

#['pulp']['server']['conf']['server']['server_name'] = 'server_hostname'
default['pulp']['server']['conf']['server']['key_url'] = '/pulp/gpg'
default['pulp']['server']['conf']['server']['ks_url'] = '/pulp/ks'
default['pulp']['server']['conf']['server']['default_login'] = 'admin'
default['pulp']['server']['conf']['server']['default_password'] = 'admin'
default['pulp']['server']['conf']['server']['debugging_mode'] = false

default['pulp']['server']['conf']['security']['cacert'] = 'etc/pki/pulp/ca.crt'
default['pulp']['server']['conf']['security']['cakey'] = '/etc/pki/pulp/ca.key'
default['pulp']['server']['conf']['security']['ssl_ca_certificate'] = '/etc/pki/pulp/ssl_ca.crt'
default['pulp']['server']['conf']['security']['user_cert_expiration'] = 7
default['pulp']['server']['conf']['security']['consumer_cert_expiration'] = 3650
default['pulp']['server']['conf']['security']['serial_number_path'] =  '/var/lib/pulp/sn.dat'

default['pulp']['server']['conf']['consumer_history']['lifetime'] = 180

default['pulp']['server']['conf']['coordinator']['task_state_poll_interval'] = 0.1

default['pulp']['server']['conf']['data_reaping']['reaper_interval'] = 0.25
default['pulp']['server']['conf']['data_reaping']['archived_calls'] = 0.5
default['pulp']['server']['conf']['data_reaping']['consumer_history'] = 60
default['pulp']['server']['conf']['data_reaping']['repo_sync_history'] = 60
default['pulp']['server']['conf']['data_reaping']['repo_publish_history'] = 60
default['pulp']['server']['conf']['data_reaping']['repo_group_publish_history'] = 60

default['pulp']['server']['conf']['oauth']['enabled'] = false
default['pulp']['server']['conf']['oauth']['oauth_key'] = nil
default['pulp']['server']['conf']['oauth']['oauth_secret'] = nil

default['pulp']['server']['conf']['logs']['config'] = '/etc/pulp/logging/basic.cfg'
default['pulp']['server']['conf']['logs']['db_config'] = '/etc/pulp/logging/db.cfg'

default['pulp']['server']['conf']['messaging']['url'] = 'tcp://localhost:5672'
default['pulp']['server']['conf']['messaging']['cacert'] = '/etc/pki/qpid/ca/ca.crt'
default['pulp']['server']['conf']['messaging']['clientcert'] = '/etc/pki/qpid/client/client.pem'
default['pulp']['server']['conf']['messaging']['topic_exchange'] = "'amq.topic'"
default['pulp']['server']['conf']['messaging']['install_timeout'] = '30s:12h'
default['pulp']['server']['conf']['messaging']['update_timeout'] = '30s:12h'
default['pulp']['server']['conf']['messaging']['uninstall_timeout'] = '30s:12h'
default['pulp']['server']['conf']['messaging']['bind_timeout'] = '30d:6h'
default['pulp']['server']['conf']['messaging']['unbind_timeout'] = '30d:6h'

default['pulp']['server']['conf']['scheduler']['dispatch_interval'] = 30

default['pulp']['server']['conf']['tasks']['concurrency_threshold'] = 9
default['pulp']['server']['conf']['tasks']['dispatch_interval'] = 0.5
default['pulp']['server']['conf']['tasks']['archived_call_lifetime'] = 48
default['pulp']['server']['conf']['tasks']['consumer_content_weight'] = 0
default['pulp']['server']['conf']['tasks']['create_weight'] = 0
default['pulp']['server']['conf']['tasks']['publish_weight'] = 1
default['pulp']['server']['conf']['tasks']['sync_weight'] = 2

default['pulp']['server']['conf']['email']['host'] = 'localhost'
default['pulp']['server']['conf']['email']['port'] = 25
default['pulp']['server']['conf']['email']['from'] = 'no-reply@your.domain'
default['pulp']['server']['conf']['email']['enabled'] = false
