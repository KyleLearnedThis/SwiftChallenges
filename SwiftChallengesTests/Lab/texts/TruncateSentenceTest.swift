//
//  TruncateSentenceTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 7/18/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class TruncateSentenceTest: XCTestCase {

    func testBasic() throws {
        let input = "Hello how are you Contestant"
        let k = 4
        let expected = "Hello how are you"
        let actual = TruncateSentence.truncateSentence(input, k)
        XCTAssertEqual(expected, actual)
    }

}
