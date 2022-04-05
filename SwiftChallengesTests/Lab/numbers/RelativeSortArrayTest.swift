//
//  RelativeSortArrayTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/16/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class RelativeSortArrayTest: XCTestCase {

    func testBasic() throws {
        let arr1 = [2,3,1,3,2,4,6,7,9,2,19]
        let arr2 = [2,1,4,3,9,6]
        let expected = [2,2,2,1,4,3,3,9,6,7,19]
        let actual = RelativeSortArray.relativeSortArray(arr1, arr2)
        let isEqual = actual.elementsEqual(expected)
        XCTAssertTrue(isEqual)
    }

    func testV02() throws {
        let arr1 = [26,21,11,20,50,34,1,18]
        let arr2 = [21,11,26,20]
        let expected = [21,11,26,20,1,18,34,50]
        let actual = RelativeSortArray.relativeSortArray(arr1, arr2)
        let isEqual = actual.elementsEqual(expected)
        XCTAssertTrue(isEqual)
    }
}
