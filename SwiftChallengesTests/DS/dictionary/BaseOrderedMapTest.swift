//
//  BaseOrderedMapTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/6/22.
//

import XCTest

class BaseOrderedMapTest: XCTestCase {
    func testBasic01() throws {
        let x = [10000, 1000, 100, 10, 1]
        let y = ["A", "B", "C", "D", "E"]
        let dict = BaseOrderedMap<Int,String>()
        for i in x.indices {
            let key = x[i]
            let value = y[i]
            dict[key] = value
        }

        for key in dict.keys {
            let value = String(describing: dict[key]!)
            print("[\(key):\(value)]", terminator: " ")
        }
        print("")
    }

    func testBasic02() throws {
        let x = [10000, 1000, 100, 10, 1]
        let y = ["A", "B", "C", "D", "E"]
        let dict = BaseOrderedMap<Int,String>()
        for i in x.indices {
            let key = x[i]
            let value = y[i]
            dict[key] = value
        }

        dict[10000] = "A"

        for key in dict.keys {
            let value = String(describing: dict[key]!)
            print("[\(key):\(value)]", terminator: " ")
        }
        print("")
    }
}
