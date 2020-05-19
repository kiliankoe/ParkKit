import Foundation
import XCTest
import ParkKit

class ParkKitTests: XCTestCase {
    func testMeta() {
        let e = expectation(description: "Receive meta response.")

        ParkKit().cities { result in
            switch result {
            case .failure(let error):
                XCTFail(String(describing: error))
                e.fulfill()
            case .success(let response):
                XCTAssert(response.cities.count >= 13)
                let dresden = response.cities.values.first { $0.name == "Dresden" }
                XCTAssert(dresden!.isActivelySupported)
                e.fulfill()
            }
        }

        waitForExpectations(timeout: 10)
    }

    func testDresdenLots() {
        let e = expectation(description: "Receive lot data for Dresden")

        ParkKit().lots(forCity: "Dresden") { result in
            switch result {
            case let .failure(error):
                XCTFail(String(describing: error))
                e.fulfill()
            case let .success(response):
                XCTAssert(response.lots.count > 0)
                e.fulfill()
            }
        }

        waitForExpectations(timeout: 5)
    }
//
//    func testForecast() {
//        let e = expectation(description: "Send a forecast request for Centrum Galerie in Dresden")
//
//        let df = DateFormatter()
//        df.dateFormat = "yyyy-MM-dd"
//
//        let startingDate = df.date(from: "2015-12-26")!
//        let endingDate = df.date(from: "2015-12-27")!
//
//        ParkKit().fetchForecast(forLot: "dresdencentrumgalerie", inCity: "Dresden", startingAt: startingDate, endingAt: endingDate) { result in
//            switch result {
//            case let .failure(error):
//                XCTFail("Failed with error: \(error)")
//            case .success(_):
//                // The tests here don't have to be based on actual forecast data since the availability of that varies a bit^^
//                e.fulfill()
//            }
//        }
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("\(error)")
//            }
//        }
//    }
//
//    func testDayForecast() {
//        let e = expectation(description: "Send a forecast request for a single day at Centrum Galerie in Dresden")
//
//        ParkKit().fetchForecast(forLot: "dresdencentrumgalerie", inCity: "Dresden", forDay: .offsetFromToday(0)) { result in
//            switch result {
//            case let .failure(error):
//                XCTFail("Failed with error: \(error)")
//            case .success(_):
//                e.fulfill()
//            }
//        }
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("\(error)")
//            }
//        }
//    }
}
