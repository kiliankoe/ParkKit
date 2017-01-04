//
//  Lot.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation
import Mapper
import CoreLocation

public struct Lot {
    public let address: String?
    public let coordinate: CLLocationCoordinate2D?
    public let hasForecast: Bool
    public let free: Int
    public let total: Int
    public let id: String
    public let type: String?
    public let name: String
    public let region: String?
    public let state: State

    public enum State: String {
        case open
        case closed
        case nodata
        case unknown
    }
}

extension Lot: Mappable {
    public init(map: Mapper) throws {
        address = map.optionalFrom("address")
        coordinate = map.optionalFrom("coords")
        try hasForecast = map.from("forecast")
        try free = map.from("free")
        try total = map.from("total")
        try id = map.from("id")
        type = map.optionalFrom("lot_type")
        try name = map.from("name")
        region = map.optionalFrom("region")
        try state = map.from("state")
    }
}
