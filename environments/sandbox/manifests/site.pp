node 'default' {

	class { 'java': 
	}
	class { 'ruby':
		gems_version => 'latest',
	}
	class { 'ruby::dev':
		rake_ensure => 'installed',
		bundler_ensure => 'installed',
	}

	file { "/etc/sudoers":
		mode => '0400',
		owner => 'root',
		group => 'root',
		source => "file:///vagrant/files/etc/sudoers",
	}

	#wrap this up in a custom module later
	package { 'rspec-puppet':
		ensure => 'latest',
		provider => 'gem',
	}
	package { 'puppet-lint':
		ensure => 'latest',
		provider => 'gem',
	}

	# local package for module testing
	package { 'mariadb-devel' :
		ensure => 'installed',
	}
	package { 'mariadb-libs' :
		ensure => 'installed',
	}
}
