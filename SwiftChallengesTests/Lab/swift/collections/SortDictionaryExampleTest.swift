//
//  SortDictionaryExampleTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class SortDictionaryExampleTest: XCTestCase {

    func testSortValueDesc() {
        let input = [2,2,2,2,1,1,1,1,1,3,3,3,4,4,5]
        _ = SortDictionaryExample.sortByKey(input, true)
    }

    func testSortValueAsc() {
        let input = [2,2,2,2,1,1,1,1,1,3,3,3,4,4,5]
        _ = SortDictionaryExample.sortByValue(input, false)
    }

    func testSortKeyDesc() {
        let input = [2,2,2,2,3,3,3,4,4,5]
        _ = SortDictionaryExample.sortByKey(input, true)
    }

    func testSortKeyAsc() {
        let input = [1,1,1,1,1,3,3,3,4,4,5]
        _ = SortDictionaryExample.sortByKey(input, false)
    }

}
