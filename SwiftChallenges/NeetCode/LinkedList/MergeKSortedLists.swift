//
//  MergeKSortedLists.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/7/26.
//  https://leetcode.com/problems/merge-k-sorted-lists/

class MergeKSortedLists {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        var remaining = lists

        while remaining.count > 1 {
            var merged: [ListNode?] = []
            var i = 0
            while i < remaining.count {
                let left = remaining[i]
                let right = (i + 1 < remaining.count) ? remaining[i + 1] : nil
                merged.append(mergeTwoLists(left, right))
                i += 2
            }
            remaining = merged
        }

        return remaining[0]
    }

    private func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var l1 = list1
        var l2 = list2

        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                tail?.next = l1
                l1 = l1?.next
            } else {
                tail?.next = l2
                l2 = l2?.next
            }
            tail = tail?.next
        }

        tail?.next = l1 ?? l2

        return dummy.next
    }
}
