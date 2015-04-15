node['pulp']['repositories'].each do |r|

  execute "check pulp repo #{r} exists" do
    command "echo scheduling creation of pulp repo #{r} .. for once apache has been restarted"
    notifies :run, "execute[create pulp repo #{r}]", :delayed
    not_if "pulp-admin -uadmin -padmin rpm repo list | gawk '/^Id:/ { print $2 }' | grep #{r}"
  end

  execute "create pulp repo #{r}" do
    command "pulp-admin -uadmin -padmin rpm repo create --repo-id #{r}"
    action :nothing
  end

end
