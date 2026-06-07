//
//  MergeTwoSortedListsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/6/26.
//

import XCTest

class MergeTwoSortedListsTest: XCTestCase {
    let solution = MergeTwoSortedLists()

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

    // LeetCode example 1: [1,2,4] + [1,3,4] -> [1,1,2,3,4,4]
    func testExample1() {
        let list1 = makeList([1, 2, 4])
        let list2 = makeList([1, 3, 4])
        let result = solution.mergeTwoLists(list1, list2)
        XCTAssertEqual(toArray(result), [1, 1, 2, 3, 4, 4])
    }

    // LeetCode example 2: [] + [] -> []
    func testExample2BothEmpty() {
        let result = solution.mergeTwoLists(nil, nil)
        XCTAssertNil(result)
    }

    // LeetCode example 3: [] + [0] -> [0]
    func testExample3OneEmpty() {
        let list2 = makeList([0])
        let result = solution.mergeTwoLists(nil, list2)
        XCTAssertEqual(toArray(result), [0])
    }

    func testList1Empty() {
        let list2 = makeList([1, 2, 3])
        let result = solution.mergeTwoLists(nil, list2)
        XCTAssertEqual(toArray(result), [1, 2, 3])
    }

    func testList2Empty() {
        let list1 = makeList([1, 2, 3])
        let result = solution.mergeTwoLists(list1, nil)
        XCTAssertEqual(toArray(result), [1, 2, 3])
    }

    func testList1Longer() {
        let list1 = makeList([1, 3, 5, 7])
        let list2 = makeList([2, 4])
        let result = solution.mergeTwoLists(list1, list2)
        XCTAssertEqual(toArray(result), [1, 2, 3, 4, 5, 7])
    }

    func testList2Longer() {
        let list1 = makeList([2, 4])
        let list2 = makeList([1, 3, 5, 7])
        let result = solution.mergeTwoLists(list1, list2)
        XCTAssertEqual(toArray(result), [1, 2, 3, 4, 5, 7])
    }

    func testDuplicateValues() {
        let list1 = makeList([1, 1, 1])
        let list2 = makeList([1, 1, 1])
        let result = solution.mergeTwoLists(list1, list2)
        XCTAssertEqual(toArray(result), [1, 1, 1, 1, 1, 1])
    }

    func testSingleNodeEach() {
        let list1 = makeList([1])
        let list2 = makeList([2])
        let result = solution.mergeTwoLists(list1, list2)
        XCTAssertEqual(toArray(result), [1, 2])
    }

    func testResultIsSorted() {
        let list1 = makeList([1, 3, 5])
        let list2 = makeList([2, 4, 6])
        let result = solution.mergeTwoLists(list1, list2)
        let arr = toArray(result)
        XCTAssertEqual(arr, arr.sorted())
    }
}
