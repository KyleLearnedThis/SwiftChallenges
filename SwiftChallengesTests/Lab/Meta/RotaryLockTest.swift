//
//  RotaryLockTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/30/22.
//

import XCTest

class RotaryLockTest: XCTestCase {
    func testBasic() throws {
        let N = 10
        let M = 4
        let C = [9,4,4,8]
        let expected = 11
        let actual = RotaryLock.getMinCodeEntryTime(N, M, C)
        XCTAssertEqual(expected, actual)
    }
}
