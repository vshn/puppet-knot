# == Class knot::params
#
# This class is meant to be called from knot.
# It sets variables according to platform.
#
class knot::params {

  # OS specific parameters
  case $facts['os']['family'] {
    'Debian': {
      $package_name = 'knot'
      $service_name = 'knot'
      $service_user = 'knot'
      $service_group = 'knot'
      $package_repo_location = 'https://pkg.labs.nic.cz/knot-dns'
      $package_repo_repos = 'main'
      $package_repo_key = '9C71D59CD4CE8BD2966A7A3EAB6A303124019B64'
      $package_repo_key_src = undef
    }
    'RedHat': {
      $package_name = 'knot'
      $service_name = 'knot'
      $service_user = 'knot'
      $service_group = 'knot'
      $package_repo_location = undef
      $package_repo_repos = undef
      $package_repo_key = undef
      $package_repo_key_src = undef
    }
    default: {
      fail("OS family ${facts['os']['family']} not supported")
    }
  }

  ## Default parameters
  $server = {
    'listen' => [ '0.0.0.0@53', '::@53' ]
  }
  $log = {
    'syslog' => {
      'any'  => 'info'
    },
  }

}
