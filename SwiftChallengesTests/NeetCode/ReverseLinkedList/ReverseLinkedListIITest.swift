//
//  ReverseLinkedListIITest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/7/26.
//

import XCTest

class ReverseLinkedListIITest: XCTestCase {
    let solution = ReverseLinkedListII()

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

    func testExample1() {
        // LeetCode example: [1,2,3,4,5], left=2, right=4 -> [1,4,3,2,5]
        let head = makeList([1, 2, 3, 4, 5])
        let result = solution.reverseBetween(head, 2, 4)
        XCTAssertEqual(toArray(result), [1, 4, 3, 2, 5])
    }

    func testExample2() {
        // LeetCode example: [5], left=1, right=1 -> [5]
        let head = makeList([5])
        let result = solution.reverseBetween(head, 1, 1)
        XCTAssertEqual(toArray(result), [5])
    }

    func testReverseEntireList() {
        let head = makeList([1, 2, 3, 4, 5])
        let result = solution.reverseBetween(head, 1, 5)
        XCTAssertEqual(toArray(result), [5, 4, 3, 2, 1])
    }

    func testReverseFromBeginning() {
        let head = makeList([1, 2, 3, 4, 5])
        let result = solution.reverseBetween(head, 1, 3)
        XCTAssertEqual(toArray(result), [3, 2, 1, 4, 5])
    }

    func testReverseToEnd() {
        let head = makeList([1, 2, 3, 4, 5])
        let result = solution.reverseBetween(head, 3, 5)
        XCTAssertEqual(toArray(result), [1, 2, 5, 4, 3])
    }

    func testLeftEqualsRight() {
        // No reversal needed
        let head = makeList([1, 2, 3])
        let result = solution.reverseBetween(head, 2, 2)
        XCTAssertEqual(toArray(result), [1, 2, 3])
    }

    func testTwoNodeList() {
        let head = makeList([1, 2])
        let result = solution.reverseBetween(head, 1, 2)
        XCTAssertEqual(toArray(result), [2, 1])
    }
}
