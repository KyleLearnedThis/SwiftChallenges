//
//  ContainsDuplicateTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/26/26.
//

import XCTest

class ContainsDuplicateTest: XCTestCase {
    let cd = ContainsDuplicate()
    func testContainsDuplicate() {
        let input1: [Int] = [1, 2, 3, 1]
        let expected: Bool = true
        let actual = cd.containsDuplicate(input1)
        XCTAssertEqual(actual, expected)
    }
}
