class arpwatch::service inherits arpwatch {

  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }
  
  service { 'arpwatch':
    ensure     => $service_ensure,
    enable     => $service_enable,
    name       => $service_name,
    hasstatus  => false,
    hasrestart => true,
  }

}
