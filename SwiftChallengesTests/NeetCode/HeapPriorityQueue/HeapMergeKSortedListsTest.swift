//
//  HeapMergeKSortedListsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 10/6/26.
//

import XCTest

class HeapMergeKSortedListsTest: XCTestCase {

    private let sut = HeapMergeKSortedLists()

    private func makeList(_ vals: [Int]) -> ListNode? {
        var head: ListNode?
        for val in vals.reversed() {
            head = ListNode(val, head)
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

    private func verify(
        _ lists: [[Int]],
        _ expected: [Int],
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let result = sut.mergeKLists(lists.map(makeList))
        XCTAssertEqual(toArray(result), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testNoLists() {
        verify([], [])
    }

    func testSingleList() {
        verify([[1, 2, 3]], [1, 2, 3])
    }

    func testSingleNode() {
        verify([[7]], [7])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([[1, 4, 5], [1, 3, 4], [2, 6]], [1, 1, 2, 3, 4, 4, 5, 6])
    }

    func testExample2() {
        verify([], [])
    }

    func testExample3() {
        verify([[]], [])
    }

    // MARK: - Edge cases

    func testAllEmptyLists() {
        verify([[], [], []], [])
    }

    func testSomeEmptyLists() {
        verify([[], [1, 3], [], [2, 4]], [1, 2, 3, 4])
    }

    func testSingleNodeEachList() {
        verify([[3], [1], [2]], [1, 2, 3])
    }

    func testDuplicates() {
        verify([[1, 1], [1, 1], [1, 1]], [1, 1, 1, 1, 1, 1])
    }

    func testNegativeValues() {
        verify([[-3, -1], [-4, -2], [-5, 0]], [-5, -4, -3, -2, -1, 0])
    }

    func testUnequalLengths() {
        verify([[1], [2, 3, 4, 5], [6]], [1, 2, 3, 4, 5, 6])
    }

    func testNonOverlappingRanges() {
        verify([[7, 8, 9], [1, 2, 3], [4, 5, 6]], [1, 2, 3, 4, 5, 6, 7, 8, 9])
    }

    func testBoundaryValues() {
        verify([[-10_000, 0], [10_000]], [-10_000, 0, 10_000])
    }
}
