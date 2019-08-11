//
//  Coordinate.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation
#if canImport(CoreLocation)
import CoreLocation
#endif

public struct WGSCoordinate: Decodable {
    let latitude: Double
    let longitude: Double

    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }

    #if canImport(CoreLocation)
    var coordinate2D: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    #endif
}
