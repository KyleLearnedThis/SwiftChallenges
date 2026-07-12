//
//  NumberOf1Bits.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/26.
//  https://leetcode.com/problems/number-of-1-bits/

class NumberOf1Bits {
    func hammingWeight(_ n: Int) -> Int {
        var count: Int = 0
        var n = n
        while n != 0 {
            if n % 2 == 1 {
                count += 1
            }
            n = n >> 1
        }
        return count
    }
}
