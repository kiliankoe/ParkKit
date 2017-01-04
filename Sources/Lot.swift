//
//  Lot.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation
import CoreLocation

public struct Lot {
    public let address: String
    public let coordinate: CLLocationCoordinate2D?
    public let hasForecast: Bool
    public let free: Int
    public let total: Int
    public let id: String
    public let type: String
    public let name: String
    public let region: String
    public let state: State

    public enum State: String {
        case open
        case closed
        case nodata
        case unknown
    }
}
