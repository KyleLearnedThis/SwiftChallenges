//
//  ListReverse.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class ListReverse {
    static func reverse(node: Node<Int>?) -> Node<Int>? {
        var current = node
        var prev: Node<Int>? = nil
        var next: Node<Int>? = nil

        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
}
