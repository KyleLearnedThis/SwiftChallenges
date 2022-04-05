//
//  MoveZeroesInArrayTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/18/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class MoveZeroesInArrayTest: XCTestCase {

    func testBasic() throws {
        let input = [1,2,3,0,4,5,6,7]
        let expected = [0,1,2,3,4,5,6,7]
        let actual = MoveZeroesInArray.moveZeroesToFront(input)
        XCTAssertTrue(expected.elementsEqual(actual))
    }

}
