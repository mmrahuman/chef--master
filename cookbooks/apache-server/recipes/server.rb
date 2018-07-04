package 'httpd' do
	action :install
end

file '/var/www/html/index.html' do
	content "<h1>Hello, World</h1>
	<p>ipaddress = #{node['ipaddress']}</p>
	<p>hostname = #{node['hostname']}</p>"
end

service 'httpd' do
	action [ :enable, :start ]
end
