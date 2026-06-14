//
//  GraphNode.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/13/26.
//

public class GraphNode {
    public var val: Int
    public var neighbors: [GraphNode?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
