//
//  LotTests.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 11/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation
import XCTest
import ParkKit
import CoreLocation

extension Lot {
    init(free: Int, total: Int, state: State, coord: CLLocationCoordinate2D? = nil) {
        self.address = "Dummystreet 15"
        self.coordinate = coord
        self.hasForecast = true
        self.free = free
        self.total = total
        self.id = "dummyparkinglot"
        self.type = "Parkplatz"
        self.name = "Dummy Parkinglot"
        self.region = "Dummy Region"
        self.state = state
    }
}

class LotTests: XCTestCase {
    func testLoadPercentage() {
        let lot1 = Lot(free: 100, total: 1000, state: .open)
        XCTAssertEqual(lot1.loadPercentage, 0.9)

        let lot2 = Lot(free: 500, total: 500, state: .open)
        XCTAssertEqual(lot2.loadPercentage, 0)

        let lot3 = Lot(free: 0, total: 0, state: .open)
        XCTAssertEqual(lot3.loadPercentage, 0)
    }

    func testDistance() {
        let loc = CLLocation()

        let lot1 = Lot(free: 0, total: 0, state: .open)
        XCTAssertEqual(lot1.distance(from: loc), nil)

        let lot2 = Lot(free: 0, total: 0, state: .open, coord: CLLocationCoordinate2D())
        XCTAssertEqual(lot2.distance(from: loc), 0.0)
    }

    func testFreeRegardingClosed() {
        let lot1 = Lot(free: 100, total: 1000, state: .closed)
        XCTAssertEqual(lot1.freeRegardingClosed, 0)

        let lot2 = Lot(free: 100, total: 1000, state: .open)
        XCTAssertEqual(lot2.freeRegardingClosed, 100)
    }
}
