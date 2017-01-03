//
//  ParkError.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation
import XCTest
import ParkKit

class ParkKitTests: XCTestCase {
    func testExample() {
        let e = expectation(description: "Send a meta request")

        let park = ParkKit()
        park.fetchCities(onFailure: { error in
            print(error)
        }) { meta in
            print(meta.cities.count)
            e.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("\(error)")
            }
        }
    }
}

#if os(Linux)
extension ParkKitTests {
    static var allTests : [(String, (ParkKitTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
#endif
