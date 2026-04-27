//
//  LinkedListCycle.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/26/26.
//  https://leetcode.com/problems/linked-list-cycle/


class LinkedListCycle {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                return true
            }
        }
        return false
    }
}
