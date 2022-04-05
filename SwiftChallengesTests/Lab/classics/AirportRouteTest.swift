//
//  AirportRouteTest.swift
//  SwiftExercisesTests
//

import XCTest

class AirportRouteTest: XCTestCase {
    var route = AirportRoute()
    func testBasicRoute() {
        let input = ["LOS-JFK", "SFO-LOS", "CDG-CPH", "JFK-CDG"]
        let expected = ["SFO", "LOS", "JFK", "CDG", "CPH"]
        let actual = route.makeRoute(input: input)
        print(actual)
        XCTAssertTrue(expected == actual)
    }
}
