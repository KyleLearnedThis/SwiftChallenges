//
//  SumOfTwoLists.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 1/25/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//

import Foundation

class SumOfTwoLists {
    static func addTwoNumbers(_ l1: Node<Int>?, _ l2: Node<Int>?) -> Node<Int>? {
        var n1 = l1
        var n2 = l2
        var carry = 0
        let list = LinkedList<Int>()
        while (n1 != nil || n2 != nil || carry != 0) {
            if (n1 != nil) {
                carry += n1!.getValue()
                n1 = n1?.next
            }
            if (n2 != nil) {
                carry += n2!.getValue()
                n2 = n2?.next
            }
            list.append(value: carry % 10)
            carry /= 10
        }
        return list.getHead()
    }
}
