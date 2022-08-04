//
//  ArrayChange.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/4/22.
//

/**
 You are given an array of integers. On each move you are allowed to increase exactly one of its element by one. Find the minimal number of moves required to obtain a strictly increasing sequence from the input.

 https://wachino.github.io/codefights/codefights-arcade/codefights-arcade-intro/17_arrayChange/README.html
 **/

import Foundation

class ArrayChange {
    static func calcuateMoves(inputArray: [Int]) -> Int {
        var input = inputArray
        var max = input[0]
        var moves = 0
        for i in 1 ..< input.count {
            if input[i] <= max {
                moves += (max - input[i]) + 1
                input[i] = max + 1
            }
            max = input[i]
        }
        return moves
    }
}
