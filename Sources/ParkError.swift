//
//  ParkError.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

public enum ParkError: Error {
    case request(Error?)
    case server(statusCode: Int)
    case invalidServerURL
    case notFound
    case decoding
    case unknown
}
