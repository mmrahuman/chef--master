package 'vim'
package 'git' do
	action :install
end

package 'tree' do
	action :install
end

package 'ntp' do
	action :install
end

template '/etc/motd' do
	source 'motd.erb'
	variables(
	 :name => 'roguetech'
	)
	action :create
end

service 'ntpd' do
	action [ :enable, :start ]
end
