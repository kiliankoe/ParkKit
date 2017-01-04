//
//  City.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation
import Mapper
import CoreLocation

public struct City {
    public let name: String
    public let coordinate: CLLocationCoordinate2D
    public let source: URL
    public let url: URL
    public let attribution: Attribution?
    public let hasActiveSupport: Bool

    public struct Attribution {
        let contributor: String
        let license: String
        let url: URL
    }
}

extension City: Mappable {
    public init(map: Mapper) throws {
        try name = map.from("name")
        try coordinate = map.from("coords")
        try source = map.from("source")
        try url = map.from("url")
        attribution = map.optionalFrom("attribution")
        try hasActiveSupport = map.from("active_support")
    }
}

extension City.Attribution: Mappable {
    public init(map: Mapper) throws {
        try contributor = map.from("contributor")
        try license = map.from("license")
        try url = map.from("url")
    }
}
