//
//  Response.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

/// Meta response value containing a list of all supported cities supported by this server.
public struct MetaResponse {
    public let apiVersion: String
    public let serverVersion: String
    public let reference: String

    public let cities: [City]
}

/// Lot response value containing a list of all lots for a given city and timestamps for when the data was last updated.
public struct LotResponse {
    /// Timestamp when the data was downloaded from the city's server. Should never be more than ~5 minutes ago.
    public let lastDownloaded: Date
    /// Timestamp when the data was presumably last updated on the city's server.
    public let lastUpdated: Date

    public let lots: [Lot]
}

/// Forecast response value containing a list of forecast values.
public struct ForecastResponse {
    public let version: Double
    public let forecast: [(Date, Int)]
}

public struct StatusResponse {
    public let load: [Double]
    public let serverTime: Date
    public let status: Status

    public enum Status: String {
        case online
    }
}
