# 🚘 ParkKit

[![Travis](https://img.shields.io/travis/kiliankoe/ParkKit.svg?style=flat-square)](https://travis-ci.org/kiliankoe/ParkKit)
[![Version](https://img.shields.io/cocoapods/v/ParkKit.svg?style=flat-square)](http://cocoapods.org/pods/ParkKit)
[![License](https://img.shields.io/cocoapods/l/ParkKit.svg?style=flat-square)](http://cocoapods.org/pods/ParkKit)
[![Platform](https://img.shields.io/cocoapods/p/ParkKit.svg?style=flat-square)](http://cocoapods.org/pods/ParkKit)
[![Docs](https://img.shields.io/cocoapods/metrics/doc-percent/ParkKit.svg?style=flat-square)](http://cocoadocs.org/docsets/ParkKit)
[![Codecov](https://img.shields.io/codecov/c/github/kiliankoe/ParkKit.svg?style=flat-square)](https://codecov.io/gh/kiliankoe/ParkKit)

This is a wrapper for the API provided by [ParkAPI](https://github.com/offenesdresden/ParkAPI) for anything written in Swift. It's primary purpose is to be used by [ParkenDD](https://github.com/kiliankoe/ParkenDD).

## Example

```swift
let park = ParkKit() // uses the default server at parkendd.de
```

```swift
park.fetchCities(onFailure: {error in
	print(error)
}) { response in
	print(response.cities)
}

// ▿ 13 elements
//   ▿ ParkKit.City
//     - name: "Aarhus"
//     ▿ coordinate: __C.CLLocationCoordinate2D
//       - latitude: 56.153005
//       - longitude: 10.203201
//       ...
```

```swift
park.fetchLots(forCity: "Dresden", onFailure: {error in
	print(error)
}) { response in
	print(response.lots)
}

// ▿ 48 elements
//   ▿ ParkKit.Lot
//     ▿ address: Optional("Wilsdruffer Straße")
//       ...
```

## Requirements

Should you be hosting your own version of the ParkAPI server and using this on iOS, you might have to set up an ATS exception if you don't serve the data via HTTPS.

Using your own server is definitely recommended should you be planning on executing a large amount of requests (e.g. through a multitude of client applications). 

## Installation

ParkKit is available through Cocoapods. To install it, simply add the following line to your Podfile:

```ruby
pod "ParkKit"
```

It should also be available via Carthage and SPM, although I have not been able to verify this.

## Contributors

Kilian Koeltzsch, [@kiliankoe](https://github.com/kiliankoe)

## License

ParkKit is available under the MIT license. See the LICENSE file for more info.
