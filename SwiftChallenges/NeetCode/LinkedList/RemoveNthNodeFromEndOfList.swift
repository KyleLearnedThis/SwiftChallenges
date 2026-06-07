//
//  RemoveNthNodeFromEndOfList.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/26.
//  https://leetcode.com/problems/remove-nth-node-from-end-of-list/

class RemoveNthNodeFromEndOfList {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // dummy simplifies edge case where the head itself is removed
        let dummy = ListNode(0, head)
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy

        // advance fast n+1 steps so the gap between fast and slow is n+1
        for _ in 0...n {
            fast = fast?.next
        }

        // move both until fast falls off the end
        // gap stays fixed, so slow lands one before the target
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }

        // slow.next is the nth from end — skip over it
        slow?.next = slow?.next?.next
        return dummy.next
    }
}
