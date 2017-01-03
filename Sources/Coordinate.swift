//
//  Coordinate.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation
import Mapper

public struct Coordinate: Mappable {
    public let latitude: Double
    public let longitude: Double

    public init(map: Mapper) throws {
        try latitude = map.from("lat")
        try longitude = map.from("lng")
    }
}
