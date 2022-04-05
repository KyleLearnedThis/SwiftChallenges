//
//  RestoreStringTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 3/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class RestoreStringTest: XCTestCase {

    func testCase01() throws {
        testWork(s: "codeleet", indices: [4,5,6,7,0,2,1,3], expected: "leetcode")
    }

    func testCase02() throws {
        testWork(s: "aaiougrt", indices: [4,0,2,6,7,3,1,5], expected: "arigatou")
    }

    func testWork(s: String, indices: [Int], expected: String) {
        let actual = RestoreString.restoreString(s, indices)
        XCTAssertEqual(expected, actual)
    }
}
