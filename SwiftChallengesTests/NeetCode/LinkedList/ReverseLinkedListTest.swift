//
//  ReverseLinkedListTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/6/26.
//

import XCTest

class ReverseLinkedListTest: XCTestCase {
    let solution = ReverseLinkedList()

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

    func testNilHead() {
        XCTAssertNil(solution.reverseList(nil))
    }

    func testSingleNode() {
        let head = makeList([1])
        let result = solution.reverseList(head)
        XCTAssertEqual(toArray(result), [1])
    }

    func testTwoNodes() {
        let head = makeList([1, 2])
        let result = solution.reverseList(head)
        XCTAssertEqual(toArray(result), [2, 1])
    }

    func testExample1() {
        // LeetCode example: [1,2,3,4,5] -> [5,4,3,2,1]
        let head = makeList([1, 2, 3, 4, 5])
        let result = solution.reverseList(head)
        XCTAssertEqual(toArray(result), [5, 4, 3, 2, 1])
    }

    func testExample2() {
        // LeetCode example: [1,2] -> [2,1]
        let head = makeList([1, 2])
        let result = solution.reverseList(head)
        XCTAssertEqual(toArray(result), [2, 1])
    }

    func testOriginalListIsFullyReversed() {
        let head = makeList([3, 6, 9])
        let result = solution.reverseList(head)
        XCTAssertEqual(toArray(result), [9, 6, 3])
    }

    func testNewHeadIsOldTail() {
        let head = makeList([1, 2, 3, 4, 5])
        let result = solution.reverseList(head)
        XCTAssertEqual(result?.val, 5)
    }

    func testNewTailNextIsNil() {
        let head = makeList([1, 2, 3])
        let result = solution.reverseList(head)
        var current = result
        while current?.next != nil {
            current = current?.next
        }
        XCTAssertNil(current?.next)
        XCTAssertEqual(current?.val, 1)
    }
}
