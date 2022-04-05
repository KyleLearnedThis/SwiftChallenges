//
//  OrderedDictionaryExampleTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class OrderedDictionaryExampleTest: XCTestCase {

    func testSortValueDesc() {
        let input = [2,2,2,2,1,1,1,1,1,3,3,3,4,4,5]
        _ = OrderedDictionaryExample.orderByDictionaryValue(input, true)
    }

    func testSortValueAsc() {
        let input = [2,2,2,2,1,1,1,1,1,3,3,3,4,4,5]
        _ = OrderedDictionaryExample.orderByDictionaryValue(input, false)
    }

    func testSortKeyDesc() {
        let input = [2,2,2,2,3,3,3,4,4,5]
        _ = OrderedDictionaryExample.orderByDictionaryKey(input, true)
    }

    func testSortKeyAsc() {
        let input = [1,1,1,1,1,3,3,3,4,4,5]
        _ = OrderedDictionaryExample.orderByDictionaryKey(input, false)
    }

}
