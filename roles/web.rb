name 'web'
description 'web server role'
run_list "role[base]","recipe[workstation]","recipe[apache-server]"
default_attributes 'apache-test' => {
	'attribute1' => 'hello from attribute 1',
	'attribute2' => 'whats up'
}
