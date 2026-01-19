# CHANGELOG

## [2.3.1] - 2026-01-19
* No-change tag, as 2.3.0 existed previously without changelog entry

## [2.3.0] - 2026-01-19
### Changed
* Cleanup code formatting issues
* Replace validate_* calls with type declarations
* Replace legacy facts
* Update repository configuration (ubuntu/debian packages are now served from
  the same repository)

## [2.2.0] - 2016-09-16
### Added
* Support for DNSSEC configuration in Knot > 2.3.x
  This means that management of policies in Kasp is not needed anymore
  and is done in the Knot configuration.
  See https://lists.nic.cz/pipermail/knot-dns-users/2016-August/000918.html
  and https://www.knot-dns.cz/docs/2.x/html/configuration.html#automatic-dnssec-signing

This version of the Puppet module doesn't support Knot < 2.3.x anymore. If you
are using an older version of Knot, you should use the module version < 2.2.x

## [2.1.2] - 2016-04-29
### Added
* New parameter `$template_parameter` to define the name of the template parameter
  used in the zones hash. Can be handy if a custom zones.conf.erb is used.

## [2.1.1] - 2016-04-21
### Added
* New parameter for defining the place of the zones.conf erb template: `$zones_config_template`

### Fixed
* Various documentation updates and fixes
* Removed old parameters
* Replaced deprected `checkconf` by `conf-check`

## [2.1.0] - 2015-12-30
### Added
* New parameter for managing the server user: `$manage_user`

## [2.0.2] - 2015-12-29
### Fixed
* Typo in variable - preventing module to work under Puppet 4

## [2.0.1] - 2015-12-29
### Fixed
* Typo in variable - preventing module to work under Puppet 4

## [2.0.0] - 2015-12-29
### Added
* Support for Knot 2.x

This is a complete rewrite and does not support Knot 1.x anymore!

## [1.0.1] - 2015-02-22
### Added
* Preparations to support other OS families than only Debian
* Better metadata.json for Puppet forge
* More spec tests and travis integration

### Fixed
* Some code style issues against Puppet lint
* Correct handling of `zone_options` parameter

## [1.0.0] - 2015-02-20
### Added
* Initial release
