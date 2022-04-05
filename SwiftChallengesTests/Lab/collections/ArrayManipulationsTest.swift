//
//  ArrayManipulationsTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 7/18/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class ArrayManipulationsTest: XCTestCase {

    func testShuffle() throws {
        let input = [1,3,5,7,9,2,4,6,8,10]
        let expected = [1,2,3,4,5,6,7,8,9,10]
        let actual = ArrayManipulations.shuffle(input, input.count)
        XCTAssertEqual(expected, actual)
    }

}
