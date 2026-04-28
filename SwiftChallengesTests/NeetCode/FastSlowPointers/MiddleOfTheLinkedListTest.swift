//
//  MiddleOfTheLinkedListTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/27/26.
//

import XCTest

class MiddleOfTheLinkedListTest: XCTestCase {
    let solution = MiddleOfTheLinkedList()

    func testOddLength() {
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        let n3 = ListNode(3)
        let n4 = ListNode(4)
        let n5 = ListNode(5)
        n1.next = n2; n2.next = n3; n3.next = n4; n4.next = n5
        XCTAssertTrue(solution.middleNode(n1) === n3)
    }

    func testEvenLength() {
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        let n3 = ListNode(3)
        let n4 = ListNode(4)
        n1.next = n2; n2.next = n3; n3.next = n4
        XCTAssertTrue(solution.middleNode(n1) === n3)
    }

    func testSingleNode() {
        let n1 = ListNode(1)
        XCTAssertTrue(solution.middleNode(n1) === n1)
    }

    func testNilHead() {
        XCTAssertNil(solution.middleNode(nil))
    }

    func testTwoNodes() {
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        n1.next = n2
        XCTAssertTrue(solution.middleNode(n1) === n2)
    }
}
