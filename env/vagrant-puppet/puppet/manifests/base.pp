#
# base.pp
# Build Vagrant box configuration from modules
#
# vagrant-javadev-box
# https://github.com/rob-murray/vagrant-javadev-box
#
include wget


# Install latest jdk
class { "java":
  distribution => "jdk",
  version      => "latest",
}

class { 'gradle':
  version => '<2></2>.0',
}


# Install Maven to the vagrant users home dir and shell
file { [ "/puppet/maven/files" ]:
  ensure => "directory",
}

wget::fetch { "download-maven-bin":
  source      => "http://mirrors.ukfast.co.uk/sites/ftp.apache.org/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz",
  destination => "/puppet/maven/files/apache-maven-3.2.5-bin.tar.gz",
  verbose     => true,
  require     => File[ "/puppet/maven/files" ]
}

maven::setup { "maven":
  ensure        => "present",
  source        => "apache-maven-3.2.5-bin.tar.gz",
  deploymentdir => "/home/vagrant/apache-maven",
  user          => "vagrant",
  pathfile      => "/home/vagrant/.bashrc",
  require       => Wget::Fetch[ "download-maven-bin" ]
}
