//
//  RepeatTwoNArrayTest.swift
//  SwiftCodesTests
//
//  Created by dsch_iter on 5/24/19.
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class RepeatTwoNArrayTest: XCTestCase {

    func testBasic() {
        let tna = RepeatTwoNArray()
        let input = [1,2,3,3]
        let actual = tna.repeatedNTimes(input)
        let expected = 3
        XCTAssertEqual(expected, actual)
    }

}
