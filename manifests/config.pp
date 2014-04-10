class arpwatch::config inherits arpwatch {

  file { $service_config:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => template("arpwatch/arpwatch.${::osfamily}.erb"),
    notify  => Service['arpwatch'],
  }

}
