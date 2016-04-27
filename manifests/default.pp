#package {
#  [ 'java-1.8.0-openjdk',
#    'java-1.8.0-openjdk-devel',
#    'java-1.8.0-openjdk-headless',
#  ]:
#  ensure => installed,
#}

class { 'java': 
}

class { 'tomcat': 
  catalina_home => '/usr/share/tomcat6',
}

tomcat::instance { 'default':
  install_from_source => false,
  package_name => 'tomcat6',
  notify  => Tomcat::Service['default'],
}

tomcat::service { 'default':
  use_jsvc  => false,
  use_init  => true,
  service_name  => 'tomcat6',
  service_ensure  => 'running',
}
