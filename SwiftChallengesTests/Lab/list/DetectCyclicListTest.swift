//
//  DetectCyclicListTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 8/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class DetectCyclicListTest: XCTestCase {
    func testBasic() throws {
        let data = [1,2,3,4,5]
        let list = LinkedList(input: data)
        let tail = list.getTail()
        let head = list.getHead()
        tail?.next = head
        let actual = DetectCyclicList.hasCycle(node: head)
        let expected = true
        XCTAssertEqual(expected, actual)
    }
}
