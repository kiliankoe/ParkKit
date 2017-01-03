//
//  Lot.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

public struct Lot {
    public let address: String
    public let coordinate: Coordinate
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
