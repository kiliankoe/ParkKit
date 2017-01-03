//
//  ParkError.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

/// Possible errors encountered while using ParkKit
///
/// - invalidServerURL: The server at the specified URL does not seem to be running ParkAPI.
/// - notFound: There was no data to be found for the given query.
public enum ParkError: Error {
    case invalidServerURL
    case notFound
}
