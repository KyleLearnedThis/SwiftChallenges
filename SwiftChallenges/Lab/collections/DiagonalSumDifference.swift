//
//  DiagonalSumDifference.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/6/22.
//  https://www.hackerrank.com/challenges/diagonal-difference/problem?isFullScreen=true

import Foundation

class DiagonalSumDifference {
    static func differences(arr: [[Int]]) -> Int {
        let n = arr.count
        var first = 0
        var second = 0
        for i in arr.indices {
            let l = arr[i][i]
            let r = arr[n-i-1][i]
            first += l
            second += r
        }
        let sum: Int = abs(first - second)
        return sum
    }
}
