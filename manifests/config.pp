class arpwatch::config inherits arpwatch {

  file { $service_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0444',
    content => template("arpwatch/arpwatch.${::osfamily}.erb"),
    notify  => Service['arpwatch'],
  }

  if $ethercodes_file {
    file { $ethercodes:
      ensure => file,
      owner  => 0,
      group  => 0,
      mode   => '0444',
      source => $ethercodes_file,
      notify => Service['arpwatch'],
    }
  }

}
