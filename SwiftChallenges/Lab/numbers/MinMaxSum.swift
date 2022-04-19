//
//  MinMaxSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/15/22.
//  https://www.hackerrank.com/challenges/mini-max-sum

import Foundation

class MinMaxSum {
    static func bothSum(arr: [Int]) -> (Int, Int) {
        let max = arr.max()!
        let min = arr.min()!
        let minSum = arr.filter{$0 != max}.reduce(0,+)
        let maxSum = arr.filter{$0 != min}.reduce(0,+)
        return (minSum, maxSum)
    }
}
