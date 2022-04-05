//
//  AnagramTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 7/30/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class AnagramTest: XCTestCase {
    func testBasic() throws {
        let expected = true
        let actual = Anagram.isAnagram(first: "listen", second: "silent")
        XCTAssertEqual(expected, actual)
    }
}
