//
//  City.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

/// Slightly bigger than a town, you get the idea.
public struct City: Decodable {
    /// Name of the city, e.g. "Dresden"
    public let name: String
    /// Center coordinate
    public let coordinate: WGSCoordinate
    /// The data source where ParkAPI gathers the lot data. Could be a feed or HTML page.
    public let source: URL
    /// A url that can be used for linking to a city's data.
    public let url: URL
    /// Attribution information containing metadata, if known.
    public let attribution: Attribution?
    /// True if the city is being actively supported (updated rather quickly if things break).
    public let hasActiveSupport: Bool

    private enum CodingKeys: String, CodingKey {
        case name
        case coordinate = "coords"
        case source
        case url
        case attribution
        case hasActiveSupport = "active_support"
    }

    /// Attribution information
    public struct Attribution: Decodable {
        /// Who owns or contributed the given data.
        let contributor: String
        /// What license is the data being provided under.
        let license: String
        /// URL to more legal information regarding the data.
        let url: URL

        // private enum CodingKeys: String, CodingKey {
        //     case contributor
        //     case license
        //     case url
        // }
    }
}
