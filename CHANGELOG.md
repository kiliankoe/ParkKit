# Changelog

## Unreleased

- Upgrade project to current Swift package.
- Remove dependency on Marshal, use Codable instead.
- Make package compatible with non-Darwin platforms (remove hard dependency on CoreLocation).

## [0.4.0] - 2017-05-20

- Add two convenience functions for fetching forecast data.

## [0.3.0] - 2017-05-19

- Use Marshal instead of Mapper to map JSON.
- Improve async API calls to use Result type instead of two closures.

## [0.2.2] - 2017-01-11

### Fixed

- Issue with wrong timezone being used for timestamps in server responses.

## [0.2.1] - 2017-01-11

### Changed

- List of cities from `fetchCities` is now sorted alphabetically.

## [0.2.0] - 2017-01-04

### Added

- Extended `Lot` with `loadPercentage`, `distance(from:)` and `freeRegardingClosed` helpers, since these were previously being used in ParkenDD.

## [0.1.0] - 2017-01-04

### Added

- Fetching of forecast data.

