//
//  SortByMemberTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class SortByMemberTest: XCTestCase {

    func testSortPair() {
        var n = [BasicPair]()
        n.append(BasicPair(4, "USA"))
        n.append(BasicPair(3, "Japan"))
        n.append(BasicPair(2, "Canada"))
        n.append(BasicPair(1, "Earth"))
        _ = SortByMember.sortPair(n)
    }

    func testSortTuple() {
        var n = [(Int, String)]()
        n.append((4, "USA"))
        n.append((3, "Japan"))
        n.append((2, "Canada"))
        n.append((1, "Earth"))
        _ = SortByMember.sortTuple(n)
    }

}
