//
//  LeadersInArrayTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 11/29/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class LeadersInArrayTest: XCTestCase {

    func testBasic() throws {
        let input = [16,17,4,3,5,2]
        let expected = [17,5,2]
        let actual = LeadersInArray.leaders(arr: input)
        XCTAssertEqual(expected, actual)
    }

}
