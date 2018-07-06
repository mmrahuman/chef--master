# notifies :action, 'resource[name]', :timer
# subscribers :action, 'resource[name]', :timer
# before, :delayed, :immediately
#

if host[platform] == 'centos' do

 package 'httpd' do
	action :install
 end
end

cookbook_file 'var/www/html/example.html' do
	source 'example.html'
end

remote_file '/var/www/html/pic.png' do
	source 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/280px-PNG_transparency_demonstration_1.png'
end

template '/var/www/html/index.html' do
	source 'index.html.erb'
	variables(
		:servername => 'roguetech' )
	action :create
	notifies :restart, 'service[httpd]', :immediately
end

#bash "inline script" do
#	user "root"
#	code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites/"
#	not_if '[ -d /var/www/mysites/ ]'
	#only_if
#end

#execute "run a script" dp
#	user "root"
#	command <<-EOH
#	mkdir -p /var/www/mysites/ /
#	chown -R apache /var/www/mysite/
#	EOH
#	not_if
#end

#execute "run_script" do
#	user "root"
#	command './myscript.sh'
#	not_if
#end

service 'httpd' do
	action [ :enable, :start ]
	#subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
