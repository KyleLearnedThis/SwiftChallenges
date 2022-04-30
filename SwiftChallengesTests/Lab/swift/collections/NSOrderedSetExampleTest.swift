//
//  NSOrderedSetExampleTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/30/22.
//

import XCTest

class NSOrderedSetExampleTest: XCTestCase {

    func testBasic01() throws {
        let set = NSOrderedSetExample.basic()
        printSet(set)
    }

    func testIntersect() throws {
        let a = [1,2,3,4,5,6,7]
        let b = [4,5,6,7,8,9,10]
        let expected = NSMutableOrderedSet(array: [4,5,6,7])
        let actual = NSOrderedSetExample.intersect(a, b)
        printSet(actual)
        XCTAssertEqual(expected, actual)
    }

    func printSet(_ set: NSMutableOrderedSet) {
        for i in 0..<set.count {
            let value = set.object(at: i)
            print("[\(value)] ", terminator: "")
        }
        print()
    }
}
