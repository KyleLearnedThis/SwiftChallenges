//
//  ReverseLinkedListII.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/7/26.
//  https://leetcode.com/problems/reverse-linked-list-ii/

class ReverseLinkedListII {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        // dummy simplifies edge cases where left=1 (no real node before the sublist)
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var leftPrev = dummy  // node just before the sublist to reverse
        var cur = head
        for _ in 0..<left-1 {
            leftPrev = cur
            cur = cur?.next
        }
        // standard in-place reversal over (right-left+1) nodes
        var prev: ListNode? = nil
        for _ in 0..<(right-left+1){
            let tempNext = cur?.next
            cur?.next = prev
            prev = cur
            cur = tempNext
        }
        // leftPrev?.next is still the original first node of the sublist (now the tail)
        // reconnect tail to the remainder, then attach the new head (prev) to leftPrev
        leftPrev?.next?.next = cur
        leftPrev?.next = prev
        return dummy?.next
    }
}
