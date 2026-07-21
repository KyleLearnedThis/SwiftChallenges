//
//  ReverseNodesInKGroupTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/19/26.
//

import XCTest

class ReverseNodesInKGroupTest: XCTestCase {

    private let sut = ReverseNodesInKGroup()

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

    private func verify(_ vals: [Int], _ k: Int, _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        let result = sut.reverseKGroup(makeList(vals), k)
        XCTAssertEqual(toArray(result), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testEmptyList() {
        verify([], 1, [])
    }

    func testSingleElement() {
        verify([1], 1, [1])
    }

    func testKEqualsOne() {
        // k=1 leaves the list unchanged
        verify([1, 2, 3, 4, 5], 1, [1, 2, 3, 4, 5])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        // [1,2,3,4,5], k=2 -> [2,1,4,3,5]
        verify([1, 2, 3, 4, 5], 2, [2, 1, 4, 3, 5])
    }

    func testExample2() {
        // [1,2,3,4,5], k=3 -> [3,2,1,4,5]
        verify([1, 2, 3, 4, 5], 3, [3, 2, 1, 4, 5])
    }

    // MARK: - Edge cases

    func testLengthDivisibleByK() {
        verify([1, 2, 3, 4], 2, [2, 1, 4, 3])
    }

    func testKEqualsLength() {
        verify([1, 2, 3, 4, 5], 5, [5, 4, 3, 2, 1])
    }

    func testKGreaterThanLength() {
        // No complete group of size k, list stays unchanged
        verify([1, 2, 3], 4, [1, 2, 3])
    }

    func testLeftoverTailUnreversed() {
        // [1,2,3,4,5,6,7], k=3 -> [3,2,1,6,5,4,7]
        verify([1, 2, 3, 4, 5, 6, 7], 3, [3, 2, 1, 6, 5, 4, 7])
    }
}
