//
//  LinkedListCycle2Test.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/26/26.
//

import XCTest

class LinkedListCycle2Test: XCTestCase {
    let solution = LinkedListCycle2()

    func testNoCycle() {
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        let n3 = ListNode(3)
        n1.next = n2
        n2.next = n3
        XCTAssertNil(solution.detectCycle(n1))
    }

    func testNilHead() {
        XCTAssertNil(solution.detectCycle(nil))
    }

    func testCycleAtHead() {
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        let n3 = ListNode(3)
        n1.next = n2
        n2.next = n3
        n3.next = n1
        XCTAssertTrue(solution.detectCycle(n1) === n1)
    }

    func testCycleInMiddle() {
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        let n3 = ListNode(3)
        let n4 = ListNode(4)
        let n5 = ListNode(5)
        n1.next = n2
        n2.next = n3
        n3.next = n4
        n4.next = n5
        n5.next = n3
        XCTAssertTrue(solution.detectCycle(n1) === n3)
    }

    func testSingleNodeCycle() {
        let n1 = ListNode(1)
        n1.next = n1
        XCTAssertTrue(solution.detectCycle(n1) === n1)
    }
}
