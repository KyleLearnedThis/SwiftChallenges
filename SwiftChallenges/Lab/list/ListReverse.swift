//
//  ListReverse.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class ListReverse {
    static func reverse(node: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
        var current = node
        var prev: LinkedListNode<Int>? = nil
        var next: LinkedListNode<Int>? = nil

        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
}
