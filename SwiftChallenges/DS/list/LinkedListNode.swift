//
//  Node.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

public class LinkedListNode<T: Comparable>: Comparable {
    var value: T

    public func getValue() -> T {
        return self.value
    }

    public func setValue(x: T) {
        self.value = x
    }
    
    public var prev: LinkedListNode<T>? = nil
    public var next: LinkedListNode<T>? = nil

    init(value: T) {
        self.value = value
    }

    static public func < <E:Comparable> (lhs:LinkedListNode<E>, rhs:LinkedListNode<E>) -> Bool {
        return lhs.value < rhs.value
    }

    static public func == <E:Comparable> (lhs:LinkedListNode<E>, rhs:LinkedListNode<E>) -> Bool {
        return lhs.value == rhs.value
    }
}
