//
//  RandomNumberTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 8/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class RandomNumberTest: XCTestCase {
    func testBasic() throws {
        let withinRange = 0..<100
        let x = RandomNumber.randomInt(range: withinRange)
        print("===== x: \(x) =====")
        XCTAssertTrue(withinRange ~= x)
    }
}
