package 'httpd' do
	action :install
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
end

service 'httpd' do
	action [ :enable, :start ]
end
