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

        ParkKit().fetchCities { result in
            switch result {
            case let .failure(error):
                XCTFail("Failed with error: \(error)")
            case let .success(response):
                XCTAssert(response.cities.count >= 13)
                e.fulfill()
            }
        }

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("\(error)")
            }
        }
    }

    func testDresdenLots() {
        let e = expectation(description: "Send a lot request for Dresden")

        ParkKit().fetchLots(forCity: "Dresden") { result in
            switch result {
            case let .failure(error):
                XCTFail("Failed with error: \(error)")
            case let .success(response):
                XCTAssert(response.lots.count > 0)
                e.fulfill()
            }
        }

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("\(error)")
            }
        }
    }

    func testForecast() {
        let e = expectation(description: "Send a forecast request for Centrum Galerie in Dresden")

        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"

        let startingDate = df.date(from: "2015-12-26")!
        let endingDate = df.date(from: "2015-12-27")!

        ParkKit().fetchForecast(forLot: "dresdencentrumgalerie", inCity: "Dresden", startingAt: startingDate, endingAt: endingDate) { result in
            switch result {
            case let .failure(error):
                XCTFail("Failed with error: \(error)")
            case .success(_):
                // The tests here don't have to be based on actual forecast data since the availability of that varies a bit^^
                e.fulfill()
            }
        }

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("\(error)")
            }
        }
    }

    static var allTests = {
        return [
            ("testMeta", testMeta),
            ("testDresdenLots", testDresdenLots),
            ("testForecast", testForecast),
        ]
    }
}
