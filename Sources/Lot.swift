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

/// A parking lot, e.g. 🚗 🅿️ 🚙
public struct Lot {
    /// Street address, if known.
    public let address: String?
    /// A specific coordinate, if known.
    public let coordinate: CLLocationCoordinate2D?
    /// True if forecast data is available for this lot. Can be fetched via ParkKit().fetchForecast
    public let hasForecast: Bool
    /// How many free parking spots are available.
    public let free: Int
    /// How many parking spots are available in total.
    public let total: Int
    /// Unique id for this lot. To be used in forecast requests.
    public let id: String
    /// Is this a structure or underground?
    public let type: String?
    /// Identifiable name.
    public let name: String
    /// Possibly a district or something similar.
    public let region: String?
    /// The state the lot is in.
    public let state: State

    /// States a lot can be in.
    ///
    /// - open: Open for business.
    /// - closed: Closed, new arrivals can't park here.
    /// - nodata: The source provides no information.
    /// - unknown: Unknown.
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
