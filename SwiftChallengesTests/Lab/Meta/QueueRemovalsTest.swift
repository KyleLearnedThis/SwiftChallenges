//
//  QueueRemovalsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/2/22.
//

import XCTest

class QueueRemovalsTest: XCTestCase {
    func testBasicV01() throws {
        let input = [1, 2, 2, 3, 4, 5]
        let x = 5
        let expected = [5, 6, 4, 1, 2]
        let actual = QueueRemovals.findPositions(input: input, x: x)
        XCTAssertEqual(expected, actual)
    }
}
