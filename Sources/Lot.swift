//
//  Lot.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

public struct Lot {
    let address: String
    let coordinate: Coordinate
    let hasForecast: Bool
    let free: Int
    let total: Int
    let id: String
    let type: String
    let name: String
    let region: String
    let state: State

    public enum State: String {
        case open
        case closed
        case nodata
        case unknown
    }
}
