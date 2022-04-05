//
//  TopKElementsTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class TopKElementsTest: XCTestCase {

    func testBasic() {
        let tk = TopKElements()
        let input = [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5]
        let k = 3
        let expected = 3
        let actual = tk.topKFrequent(input, k: k)
        XCTAssertEqual(expected, actual)
    }

}
