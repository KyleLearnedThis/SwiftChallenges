//
//  BoxBlurTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/6/22.
//

import XCTest

class BoxBlurTest: XCTestCase {
    func testBasic01() {
        let image = [[1, 1, 1],
                     [1, 7, 1],
                     [1, 1, 1]]
        let expected = [[1]]
        let actual = BoxBlur.blur(image: image)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() {
        let image = [[36,0,18,9],
                     [27,54,9,0],
                     [81,63,72,45]]
        let expected = [[40,30]]
        let actual = BoxBlur.blur(image: image)
        XCTAssertEqual(expected, actual)
    }
}
