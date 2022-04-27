//
//  SimpleLinkedList.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/27/22.
//

import Foundation


class SimpleLinkedList {
    var head: Node<Int>? = nil

    func append(value: Int) {
        if head == nil {
            head = Node(value: value)
        } else {
            let node = Node(value: value)
            last?.next = node
        }
    }

    func append(input: [Int]) {
        for num in input {
            append(value: num)
        }
    }

    var last: Node<Int>? {
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
