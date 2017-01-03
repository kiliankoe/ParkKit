//
//  City.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

public struct City {
    let name: String
    let coordinate: Coordinate
    let source: URL
    let url: URL
    let attribution: Attribution
    let hasActiveSupport: Bool

    public struct Attribution {
        let contributor: String
        let license: String
        let url: URL
    }
}
