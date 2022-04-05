//
//  CountNegativeMatrixTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 7/20/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class CountNegativeMatrixTest: XCTestCase {
    func testBasic() throws {
        let grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
        let expected = 8
        let actual = CountNegativeMatrix.countNegatives(grid)
        XCTAssertEqual(expected, actual)
    }
}
