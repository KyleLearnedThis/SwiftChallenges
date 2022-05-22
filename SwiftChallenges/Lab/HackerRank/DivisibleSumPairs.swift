//
//  DivisibleSumPairs.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/10/22.
//  https://www.hackerrank.com/challenges/divisible-sum-pairs/problem?isFullScreen=true

import Foundation

class DivisibleSumPairs {
    static func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
        let size = ar.count
        var result = 0

        // Note that these two loops are basically permutation pairs
        for i in 0..<size  {
            for j in i+1..<size {
                if i == j {
                    continue
                } else {
                    let L = ar[i]
                    let R = ar[j]
                    if ((L+R) % k) == 0 {
                        result += 1
                    }
                }
            }
        }
        return result
    }
}
