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
}
