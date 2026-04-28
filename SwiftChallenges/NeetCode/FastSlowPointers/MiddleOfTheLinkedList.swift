//
//  MiddleOfTheLinkedList.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/27/26.
//  https://leetcode.com/problems/middle-of-the-linked-list/

class MiddleOfTheLinkedList {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        /**
         While fast pointer travelled entire list, the slow pointer only travel half of it,
         which is the middle.
         */
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
