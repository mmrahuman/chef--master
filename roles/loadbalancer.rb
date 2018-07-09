name 'load-balancer'
description 'traffic load-balancer role'
run_list "recipe[mychef-client]","recipe[myhaproxy]"
default_attributes 'apache-test' => {
	'lb1' => 'load balancer lb1',
	'lb2' => 'load balancer lb2'
}
