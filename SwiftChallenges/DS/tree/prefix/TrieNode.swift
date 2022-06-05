//
//  TrieNode.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/3/22.
//

import Foundation

class TrieNode<T: Hashable> {
    var data: T
    weak var parent: TrieNode?
    var children: [T: TrieNode<T>] = [:]
//    var isTerminating: Bool = false
    var isTerminating: Bool {
        return children.isEmpty
    }

    init(value: T, parent: TrieNode? = nil, children: [T: TrieNode] = [:], isTerminating: Bool = false) {
        self.data = value
        self.parent = parent
        self.children = children
//        self.isTerminating = isTerminating
    }

    func add(child: T) {
        guard children[child] == nil else { return }
        children[child] = TrieNode(value: child, parent: self)
    }
}
