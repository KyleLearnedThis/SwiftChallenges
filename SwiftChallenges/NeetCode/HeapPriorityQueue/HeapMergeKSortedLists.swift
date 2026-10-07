//
//  HeapMergeKSortedLists.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 10/6/26.
//  https://leetcode.com/problems/merge-k-sorted-lists/

class HeapMergeKSortedLists {

    func simpleMergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let input = makeArrays(lists)
        let sorted = input.flatMap{$0}.sorted()
        var head: ListNode? = nil
        var tail: ListNode? = nil
        for num in sorted {
            if head == nil {
                tail = ListNode(num)
                head = tail
            } else {
                let cur = ListNode(num)
                tail?.next = cur
                tail = cur
            }
        }
        return head
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = SimpleHeap<ListNode> { $0.val < $1.val }

        var head: ListNode? = nil
        var tail: ListNode? = nil

        for list in lists {
            if let node = list {
                heap.push(node)
            }
        }

        while let node = heap.pop() {
            if head == nil {
                head = node
            } else {
                tail?.next = node
            }
            tail = node
            if let next = node.next {
                heap.push(next)
            }
        }
        return head
    }

    func makeArrays(_ lists: [ListNode?]) -> [[Int]] {
        var results = [[Int]]()
        for head in lists {
            var result = [Int]()
            var cur = head
            while cur != nil {
                result.append(cur!.val)
                cur = cur?.next
            }
            results.append(result)
        }
        return results
    }
}

