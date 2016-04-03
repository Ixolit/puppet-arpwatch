class arpwatch (
  $ethercodes_file = $arpwatch::params::ethercodes_file,
  $arpwatch_opts   = $arpwatch::params::arpwatch_opts,
  $service_enable  = $arpwatch::params::service_enable,
  $service_ensure  = $arpwatch::params::service_ensure,
  $service_name    = $arpwatch::params::service_name,
  $service_config  = $arpwatch::params::service_config,
  $package_ensure  = $arpwatch::params::package_ensure,
  $package_name    = $arpwatch::params::package_name,
  ) inherits arpwatch::params {

    validate_bool($service_enable)
    validate_string($service_ensure)
    validate_string($service_name)
    validate_absolute_path($service_config)
    validate_string($package_ensure)
    validate_string($package_name)

    anchor { 'arpwatch::begin': } ->
    class { '::arpwatch::install': } ->
    class { '::arpwatch::config': } ~>
    class { '::arpwatch::service': } ->
    anchor { 'arpwatch::end': }

}
