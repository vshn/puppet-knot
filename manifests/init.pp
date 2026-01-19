# == Class: knot
#
# Main class for the knot module. Every parameter needs to be passed to
# this class.
#
# === Parameters
#
# See main documentation in README.md
#
# === Examples
#
# See main documentation in README.md
#
# === Authors
#
# Tobias Brunner <tobias@tobru.ch>
#
# === Copyright
#
# Copyright 2015 Tobias Brunner
#
class knot (
  # package installation handling
  Boolean $manage_package_repo = false,
  Enum['absent', 'installed', 'present'] $package_ensure = 'installed',
  String $package_name = $knot::params::package_name,
  Optional[String] $package_repo_key = $knot::params::package_repo_key,
  Optional[String] $package_repo_key_src = $knot::params::package_repo_key_src,
  Optional[String] $package_repo_location = $knot::params::package_repo_location,
  Optional[String] $package_repo_repos = $knot::params::package_repo_repos,
  # system service configuration
  Boolean $manage_user = true,
  Boolean $service_enable = true,
  Variant[Boolean, Enum['stopped', 'running']] $service_ensure = 'running',
  String $service_group = $knot::params::service_group,
  Boolean $service_manage = true,
  String $service_name = $knot::params::service_name,
  String $service_restart = '/usr/sbin/knotc reload',
  String $service_status = '/usr/sbin/knotc status',
  String $service_user = $knot::params::service_user,
  # knot specific configuration
  Stdlib::Absolutepath $default_storage = '/var/lib/knot',
  Stdlib::Absolutepath $main_config_file = '/etc/knot/knot.conf',
  Boolean $manage_zones = true,
  String $template_parameter = 'template',
  Hash $zone_defaults = {},
  Stdlib::Absolutepath $zones_config_file = '/etc/knot/zones.conf',
  String $zones_config_template = 'knot/zones.conf.erb',
  # knot configuration sections
  Hash $acls = {},
  Hash $control = {},
  Hash $keys = {},
  Hash $log = { 'syslog' => { 'any' => 'info'} },
  Hash $modules = {},
  Hash $policies = {},
  Hash $remotes = {},
  Hash $server = { 'listen' => [ '0.0.0.0@53', '::@53' ] },
  Hash $templates = {},
  Hash $zones = {},
) inherits knot::params {

  class { 'knot::install': }
  -> class { 'knot::config': }
  ~> class { 'knot::service': }

  contain knot::install
  contain knot::config
  contain knot::service

}
