//
//  BinarySearchArrayTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/15/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class BinarySearchArrayTest: XCTestCase {
    var customInput = [BasicPair]()
    override func setUpWithError() throws {
        let keys = [1,5,6,8,10,11,15,17]
        let values = ["Apple", "Beer", "Curry", "Durian", "Eclair", "Fig", "Garlic", "Honey"]
        customInput = zip(keys, values).map {
            return BasicPair($0.0, $0.1)
        }
    }

    func testBasic() throws {
        let input = [-1,0,3,5,9,12]
        let target = 9
        let expected = 4
        let actual = BinarySearchArray.search(input, target)
        XCTAssertEqual(expected, actual)
    }

    func testCustomSearchV01() throws {
        let actual = BinarySearchArray.customSearch(customInput, target: 15)
        XCTAssertEqual("Garlic", actual?.value)
    }

    func testCustomSearchV02() throws {
        let actual = BinarySearchArray.customSearch(customInput, target: 1)
        XCTAssertEqual("Apple", actual?.value)
    }
}
