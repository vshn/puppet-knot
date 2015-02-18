# == Class knot::params
#
# This class is meant to be called from knot.
# It sets variables according to platform.
#
class knot::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'knot'
      $service_name = 'knot'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  # package parameters
  $package_ensure = installed
  $package_distcodename = $::lsbdistcodename
  $manage_package_repo = false

  # service parameters
  $service_enable = true
  $service_ensure = running
  $service_manage = true

  # knot configuration defaults
  # coming from the package installation
  $config_file = '/etc/knot/knot.conf.puppet'
  $system = {
    identity => 'on',
    version  => 'on',
    user     => 'knot.knot',
  }
  $log = {
    syslog => {
      any  => 'info'
    },
    stderr => {
      any  => 'warning'
    }
  }
  $interfaces = {
    all_ipv4  => {
      address => '0.0.0.0',
      port    => 53,
    },
    all_ipv6  => {
      address => '[::]',
      port    => 53,
    }
  }
  $control = {
    listen-on => 'knot.sock'
  }

}
