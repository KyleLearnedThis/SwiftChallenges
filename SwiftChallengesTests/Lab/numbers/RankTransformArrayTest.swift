//
//  RankTransformArrayTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 1/31/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class RankTransformArrayTest: XCTestCase {

    func testBasic() throws {
        let rta = RankTransformArray()
        let input = [40,10,20,30]
        let expected = [4,1,2,3]
        let actual = rta.arrayRankTransform(input)
        XCTAssertEqual(expected, actual, "Failed to assert result equal")
    }

    func testSame() throws {
        let rta = RankTransformArray()
        let input = [100,100,100]
        let expected = [1,1,1]
        let actual = rta.arrayRankTransform(input)
        XCTAssertEqual(expected, actual, "Failed to assert result equal")
    }

    func testMore() throws {
        let rta = RankTransformArray()
        let input = [37,12,28,9,100,56,80,5,12]
        let expected = [5,3,4,2,8,6,7,1,3]
        let actual = rta.arrayRankTransform(input)
        XCTAssertEqual(expected, actual, "Failed to assert result equal")
    }
}
