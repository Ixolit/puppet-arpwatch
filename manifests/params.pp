class arpwatch::params {

  $service_enable = true
  $service_ensure = 'running'
  $service_name   = 'arpwatch'
  $package_ensure = 'present'
  $package_name   = 'arpwatch'
  $ethercodes_file = ''

  case $::osfamily {
    'RedHat': {
      $arpwatch_opts = "-u arpwatch -e root -s 'root (Arpwatch)'"
      $service_config = '/etc/sysconfig/arpwatch'
      $ethercodes = '/var/lib/arpwatch/ethercodes.dat'
    }
    'Debian': {
      $arpwatch_opts = '-N -p'
      $service_config = '/etc/default/arpwatch'
      $ethercodes = '/usr/share/arpwatch/ethercodes.dat'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
    }
  }

}
