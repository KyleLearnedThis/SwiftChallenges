//
//  MinStack.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/26.
//  https://leetcode.com/problems/min-stack/

class MinStack {
    private var stack: [Int] = []
    private var minStack: [Int] = []

    func push(_ val: Int) {
        stack.append(val)
        minStack.append(min(val, minStack.last ?? val))
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        stack.last!
    }

    func getMin() -> Int {
        minStack.last!
    }
}
