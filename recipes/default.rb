remote_file "#{node['soapui']['path']}#{node['soapui']['tarname']}" do
	source node['soapui']['source']
	owner node['soapui']['user']
	group node['soapui']['group']
	mode '644'
end

execute 'extract_some_tar' do
	command "tar xzvf #{node['soapui']['tarname']}"
	cwd node['soapui']['path']
	not_if ( File.exists?(node['soapui']['extract']) )
end
