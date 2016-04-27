class { 'tomcat': 
  catalina_home => '/usr/share/tomcat7',
}
tomcat::instance { 'default':
  install_from_source => false,
  package_name => 'tomcat7',
}
