//
//  RemoveNthNodeFromEndOfListTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/7/26.
//

import XCTest

class RemoveNthNodeFromEndOfListTest: XCTestCase {
    let solution = RemoveNthNodeFromEndOfList()

    private func makeList(_ vals: [Int]) -> ListNode? {
        guard !vals.isEmpty else { return nil }
        let head = ListNode(vals[0])
        var current = head
        for val in vals.dropFirst() {
            let node = ListNode(val)
            current.next = node
            current = node
        }
        return head
    }

    private func toArray(_ head: ListNode?) -> [Int] {
        var result: [Int] = []
        var current = head
        while let node = current {
            result.append(node.val)
            current = node.next
        }
        return result
    }

    // LeetCode example 1: [1,2,3,4,5], n=2 -> [1,2,3,5]
    func testExample1() {
        let result = solution.removeNthFromEnd(makeList([1, 2, 3, 4, 5]), 2)
        XCTAssertEqual(toArray(result), [1, 2, 3, 5])
    }

    // LeetCode example 2: [1], n=1 -> []
    func testExample2SingleNode() {
        let result = solution.removeNthFromEnd(makeList([1]), 1)
        XCTAssertNil(result)
    }

    // LeetCode example 3: [1,2], n=1 -> [1]
    func testExample3RemoveLast() {
        let result = solution.removeNthFromEnd(makeList([1, 2]), 1)
        XCTAssertEqual(toArray(result), [1])
    }

    // remove the head
    func testRemoveHead() {
        let result = solution.removeNthFromEnd(makeList([1, 2, 3, 4, 5]), 5)
        XCTAssertEqual(toArray(result), [2, 3, 4, 5])
    }

    // remove the head of a two-node list
    func testRemoveHeadTwoNodes() {
        let result = solution.removeNthFromEnd(makeList([1, 2]), 2)
        XCTAssertEqual(toArray(result), [2])
    }

    // remove a middle node
    func testRemoveMiddle() {
        let result = solution.removeNthFromEnd(makeList([1, 2, 3, 4, 5]), 3)
        XCTAssertEqual(toArray(result), [1, 2, 4, 5])
    }

    // n equals list length (always removes head)
    func testNEqualsLength() {
        let result = solution.removeNthFromEnd(makeList([1, 2, 3]), 3)
        XCTAssertEqual(toArray(result), [2, 3])
    }
}
