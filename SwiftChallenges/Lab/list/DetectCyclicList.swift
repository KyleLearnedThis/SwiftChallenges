//
//  DetectCyclicList.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 8/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

class DetectCyclicList {
    static func hasCycle(node: LinkedListNode<Int>? ) -> Bool {
        if node == nil || node?.next == nil {
            return false
        }
        var slow = node
        var fast = node?.next
        while slow != fast {
            if fast == nil || fast?.next == nil {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
}
