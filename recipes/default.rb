remote file "#{node['soapui']['path']}#{node['soapui']['tarname']}" do
	source node['soapui']['source']
	owner 'root'
	group 'root'
	mode '644'
end

execute 'extract_some_tar' do
	command "tar xzvf #{node['soapui']['tarname']}"
	cwd node['soapui']['path']
	not_if ( File.exists?(node['soapui']['extract']) )
end
