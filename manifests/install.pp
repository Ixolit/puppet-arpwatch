class arpwatch::install inherits arpwatch {

  package { 'arpwatch':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
