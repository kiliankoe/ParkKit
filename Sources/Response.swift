//
//  Response.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

/// Response value containing a list of all supported cities supported by this server.
public struct MetaResponse {
    let apiVersion: Double
    let serverVersion: Double
    let reference: String

    let cities: [City]
}

public struct LotResponse {
    let lastDownloaded: Date
    let lastUpdated: Date

    let lots: [Lot]
}

public struct StatusResponse {
    let load: [Double]
    let serverTime: Date
    let status: Status

    public enum Status: String {
        case online
    }
}
