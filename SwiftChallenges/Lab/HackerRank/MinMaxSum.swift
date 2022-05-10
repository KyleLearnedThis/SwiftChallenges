//
//  MinMaxSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/15/22.
//  https://www.hackerrank.com/challenges/mini-max-sum

import Foundation

class MinMaxSum {
    static func bothSum(arr: [Int]) -> [Int] {
        let max = arr.max()!
        let min = arr.min()!
        var result = [Int]()
        var minSum = 0
        var maxSum = 0
        if max != min {
            minSum = arr.filter{$0 != max}.reduce(0,+)
            maxSum = arr.filter{$0 != min}.reduce(0,+)
            result = [minSum, maxSum]
        } else {
            let val = arr.dropFirst().reduce(0,+)
            result = [val, val]
        }
        return result
    }
}
