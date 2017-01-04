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
    func testMeta() {
        let e = expectation(description: "Send a meta request")

        ParkKit().fetchCities(onFailure: { error in
            print(error)
        }) { response in
            XCTAssert(response.cities.count >= 13)
            e.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("\(error)")
            }
        }
    }

    func testDresdenLots() {
        let e = expectation(description: "Send a lot request for Dresden")

        ParkKit().fetchLots(forCity: "Dresden", onFailure: { error in
            print(error)
        }) { response in
            XCTAssert(response.lots.count > 0)
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
            ("testMeta", testMeta),
            ("testDresdenLots", testDresdenLots),
        ]
    }
}
#endif
