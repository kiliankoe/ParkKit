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
    public let apiVersion: String
    public let serverVersion: String
    public let reference: String

    public let cities: [City]
}

public struct LotResponse {
    public let lastDownloaded: Date
    public let lastUpdated: Date

    public let lots: [Lot]
}

public struct StatusResponse {
    public let load: [Double]
    public let serverTime: Date
    public let status: Status

    public enum Status: String {
        case online
    }
}
