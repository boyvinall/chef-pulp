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
