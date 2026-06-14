//
//  SimpleLinkedList.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/27/22.
//

import Foundation


class SimpleLinkedList {
    var head: LinkedListNode<Int>? = nil

    func append(value: Int) {
        if head == nil {
            head = LinkedListNode(value: value)
        } else {
            let node = LinkedListNode(value: value)
            last?.next = node
        }
    }

    func append(input: [Int]) {
        for num in input {
            append(value: num)
        }
    }

    var last: LinkedListNode<Int>? {
        var cur = head
        while cur?.next != nil {
            cur = cur?.next
        }
        return cur
    }

    func display() {
        var cur = head
        while cur != nil {
            let v = String(describing: cur!.value)
            print("[\(v)] ", terminator: "")
            cur = cur?.next
        }
        print("")
    }
}
