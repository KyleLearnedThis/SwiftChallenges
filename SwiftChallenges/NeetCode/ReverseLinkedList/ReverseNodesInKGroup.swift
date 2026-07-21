//
//  ReverseNodesInKGroup.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/19/26.
//

class ReverseNodesInKGroup {

    // Reverse every consecutive block of k nodes; leave a trailing block
    // shorter than k untouched. Work group-by-group, reversing each in place.
    //
    // Key pointers per group:
    //   groupPrev  - the node just BEFORE the current group (starts at dummy)
    //   groupEnd   - the LAST node of the current group (nil => fewer than k left)
    //   groupNext  - the first node AFTER the group (groupEnd.next), our stop marker
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // dummy sits before head so the first group has a "prev" to reconnect to,
        // and dummy.next always points at the final head of the list.
        let dummy = ListNode(0, head)
        var groupPrev: ListNode? = dummy

        while true {
            // Find the group's end (the kth node from groupPrev). If it's nil the
            // remaining tail is shorter than k, so we stop and leave it as-is.
            let groupEnd = getKth(groupPrev, k)
            if groupEnd == nil {
                break
            }
            let groupNext = groupEnd?.next

            // Standard in-place reversal of the group. Seeding prev with groupNext
            // (instead of nil) reconnects the group's new tail to the rest of the
            // list automatically. Stop by identity when cur reaches groupNext.
            var prev: ListNode? = groupNext
            var cur: ListNode? = groupPrev?.next

            while cur !== groupNext {
                let temp = cur?.next
                cur?.next = prev
                prev = cur
                cur = temp
            }

            // Before: groupPrev -> [first ... groupEnd] -> groupNext
            // groupPrev.next is still the OLD first node, which is now the group's
            // tail — and it's exactly the "prev" the next group will hang off of.
            // Point groupPrev at groupEnd (the new head), then advance to that old-first
            // node for the next iteration.
            let newGroupPrev = groupPrev?.next
            groupPrev?.next = groupEnd
            groupPrev = newGroupPrev
        }

        return dummy.next
    }

    // Walk k steps forward from cur. Returns the kth node, or nil if the list
    // ends before k steps (i.e. fewer than k nodes remain).
    func getKth(_ cur: ListNode?, _ k: Int) -> ListNode? {
        var cur = cur
        var k = k
        while cur != nil, k > 0 {
            cur = cur?.next
            k = k - 1
        }
        return cur
    }
}
