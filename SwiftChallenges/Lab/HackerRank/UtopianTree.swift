//
//  UtopianTree.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/24/22.
//  https://www.hackerrank.com/challenges/utopian-tree/problem?isFullScreen=true

import Foundation

class UtopianTree {
    func utopianTree(n: Int) -> Int {
        var result = 0
        for i in 0...n {
            if i == 0 {
                result = 1
                continue
            }
            if i % 2 == 1 {
                result = oddCycle(n: result)
            } else {
                result = evenCycle(n: result)
            }
        }
        return result
    }

    private func oddCycle(n: Int) -> Int {
        return n * 2
    }

    private func evenCycle(n: Int) -> Int {
        return n + 1
    }
}
