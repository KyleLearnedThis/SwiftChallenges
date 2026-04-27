//
//  LinkedListCycle2.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/26/26.
//  https://leetcode.com/problems/linked-list-cycle-ii/
//  Floyd's Cycle Detection Algorithm

class LinkedListCycle2 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard detectCycleNode(head) != nil else { return nil }
        var meetingNode = detectCycleNode(head)
        var currentNode = head
        while currentNode !== meetingNode {
            currentNode = currentNode?.next
            meetingNode = meetingNode?.next
        }
        return currentNode
    }
    
    func detectCycleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast { return slow }
        }
        return nil
    }
}
