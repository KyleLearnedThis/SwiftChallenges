//
//  RichestCustomerWealthTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class RichestCustomerWealthTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCase01() throws {
        let input = [[1,2,3],[3,2,1]]
        let expected = 6
        let actual = RichestCustomerWealth.maximumWealth(input)
        XCTAssertEqual(expected, actual, "Failed to validate actual result to the expectation")
    }

    func testCase02() throws {
        let input = [[1,5],[7,3],[3,5]]
        let expected = 10
        let actual = RichestCustomerWealth.maximumWealth(input)
        XCTAssertEqual(expected, actual, "Failed to validate actual result to the expectation")
    }

    func testCase03() throws {
        let input = [[2,8,7],[7,1,3],[1,9,5]]
        let expected = 17
        let actual = RichestCustomerWealth.maximumWealth(input)
        XCTAssertEqual(expected, actual, "Failed to validate actual result to the expectation")
    }

}
