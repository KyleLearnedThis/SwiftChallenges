//
//  ThreeColorSortingTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/4/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class ThreeColorSortingTest: XCTestCase {

    func testBasic() throws {
        var input = [2,0,2,1,1,0]
        let expected = [0,0,1,1,2,2]
        ThreeColorSorting.sortColors(&input)
        printArray(input)
        XCTAssertEqual(expected, input)
    }

    private func printArray(_ array: [Int]) {
        for i in array {
            print("\(i)", terminator: " ")
        }
    }

    func testSwap() throws {
        var input = [9,8,7,6,5]
        ThreeColorSorting.swap(&input, 0, 4)
        printArray(input)
    }
}
