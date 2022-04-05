//
//  BinarySearchArrayTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/15/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class BinarySearchArrayTest: XCTestCase {

    func testBasic() throws {
        let input = [-1,0,3,5,9,12]
        let target = 9
        let expected = 4
        let actual = BinarySearchArray.search(input, target)
        XCTAssertEqual(expected, actual)
    }

}
