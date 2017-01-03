//
//  City.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation
import Mapper

public struct City: Mappable {
    public let name: String
    public let coordinate: Coordinate
    public let source: URL
    public let url: URL
    public let attribution: Attribution?
    public let hasActiveSupport: Bool

    public init(map: Mapper) throws {
        try name = map.from("name")
        try coordinate = map.from("coords")
        try source = map.from("source")
        try url = map.from("url")
        attribution = map.optionalFrom("attribution")
        try hasActiveSupport = map.from("active_support")
    }

    public struct Attribution: Mappable {
        let contributor: String
        let license: String
        let url: URL

        public init(map: Mapper) throws {
            try contributor = map.from("contributor")
            try license = map.from("license")
            try url = map.from("url")
        }
    }
}
