//
//  DailyTemperaturesTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class DailyTemperaturesTest: XCTestCase {

    func testBasic() {
        let input = [73, 74, 75, 71, 69, 72, 76, 73]
        let dt = DailyTemperatures()
        let actual = dt.dailyTemperatures(input)
        let expected = [1, 1, 4, 2, 1, 1, 0, 0]
        XCTAssertEqual(expected, actual)
    }

}
