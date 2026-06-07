//
//  MergeKSortedListsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/7/26.
//

import XCTest

class MergeKSortedListsTest: XCTestCase {
    let solution = MergeKSortedLists()

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

    // LeetCode example 1: [[1,4,5],[1,3,4],[2,6]] -> [1,1,2,3,4,4,5,6]
    func testExample1() {
        let lists: [ListNode?] = [makeList([1, 4, 5]), makeList([1, 3, 4]), makeList([2, 6])]
        let result = solution.mergeKLists(lists)
        XCTAssertEqual(toArray(result), [1, 1, 2, 3, 4, 4, 5, 6])
    }

    // LeetCode example 2: [] -> []
    func testExample2EmptyInput() {
        let result = solution.mergeKLists([])
        XCTAssertNil(result)
    }

    // LeetCode example 3: [[]] -> []
    func testExample3SingleEmptyList() {
        let result = solution.mergeKLists([nil])
        XCTAssertNil(result)
    }

    func testSingleList() {
        let lists: [ListNode?] = [makeList([1, 2, 3])]
        let result = solution.mergeKLists(lists)
        XCTAssertEqual(toArray(result), [1, 2, 3])
    }

    func testAllEmptyLists() {
        let lists: [ListNode?] = [nil, nil, nil]
        let result = solution.mergeKLists(lists)
        XCTAssertNil(result)
    }

    func testSomeEmptyLists() {
        let lists: [ListNode?] = [nil, makeList([1, 3]), nil, makeList([2, 4])]
        let result = solution.mergeKLists(lists)
        XCTAssertEqual(toArray(result), [1, 2, 3, 4])
    }

    func testSingleNodeEachList() {
        let lists: [ListNode?] = [makeList([3]), makeList([1]), makeList([2])]
        let result = solution.mergeKLists(lists)
        XCTAssertEqual(toArray(result), [1, 2, 3])
    }

    func testDuplicateValues() {
        let lists: [ListNode?] = [makeList([1, 1]), makeList([1, 1]), makeList([1, 1])]
        let result = solution.mergeKLists(lists)
        XCTAssertEqual(toArray(result), [1, 1, 1, 1, 1, 1])
    }

    func testNegativeValues() {
        let lists: [ListNode?] = [makeList([-3, -1]), makeList([-4, -2]), makeList([-5, 0])]
        let result = solution.mergeKLists(lists)
        XCTAssertEqual(toArray(result), [-5, -4, -3, -2, -1, 0])
    }

    func testUnequalLengthLists() {
        let lists: [ListNode?] = [makeList([1]), makeList([2, 3, 4, 5]), makeList([6])]
        let result = solution.mergeKLists(lists)
        XCTAssertEqual(toArray(result), [1, 2, 3, 4, 5, 6])
    }

    func testResultIsSorted() {
        let lists: [ListNode?] = [makeList([5, 10]), makeList([1, 7]), makeList([3, 8])]
        let result = solution.mergeKLists(lists)
        let arr = toArray(result)
        XCTAssertEqual(arr, arr.sorted())
    }
}
