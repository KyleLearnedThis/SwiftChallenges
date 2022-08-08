//
//  ArrayMaxAdjacent.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/4/22.
//  CodeSignal: arrayMaximalAdjacentDifference

import Foundation


class ArrayMaxAdjacent {
    // Problem Constraint: Array size from at least 3
    func arrayMaximalAdjacentDifference(inputArray: [Int]) -> Int {
        var max = inputArray[1] - inputArray[0]
        for i in 2 ..< inputArray.count {
            let l = inputArray[i]
            let r = inputArray[i-1]
            let diff = abs(l - r)
            if diff > max {
                max = diff
            }
        }
        return max
    }

}
