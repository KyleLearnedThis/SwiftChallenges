//
//  MergeTwoSortedLists.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/26.
//  https://leetcode.com/problems/merge-two-sorted-lists/

class MergeTwoSortedLists {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var m = list1
        var n = list2

        while m != nil && n != nil {
            if m!.val <= n!.val {
                tail?.next = m
                m = m?.next
            } else {
                tail?.next = n
                n = n?.next
            }
            tail = tail?.next
        }

        tail?.next = m ?? n

        return dummy.next
    }
}
