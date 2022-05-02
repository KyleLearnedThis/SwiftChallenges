//
//  NumberOfWaysTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/14/22.
//

import XCTest

class NumberOfWaysTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let arr = [1, 2, 3, 4, 3]
        let k = 6
        let expected = 2
        let actual = NumberOfWays.numberOfWays(arr: arr, k: k)
        XCTAssertEqual(expected, actual)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
