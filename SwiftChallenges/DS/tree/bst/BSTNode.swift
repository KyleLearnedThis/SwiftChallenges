//
//  BSTNode.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

public class BSTNode<T> {
    open var data: T
    open var left: BSTNode?
    open var right: BSTNode?

    public init(data: T,
        leftNode: BSTNode? = nil,
        rightNode: BSTNode? = nil) {
        self.data = data
        self.left = leftNode
        self.right = rightNode
    }
}
