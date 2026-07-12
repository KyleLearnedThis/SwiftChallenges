//
//  ReverseBits.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/26.
//  https://leetcode.com/problems/reverse-bits/

class ReverseBits {

    func reverseBits(_ n: Int) -> Int {
        var result = 0
        for i in 0..<32 {
            // Extract bit i from n, starting at the least significant bit
            let bit = (n >> i) & 1
            // Building from the most significant bit down
            result = (result << 1) | bit
        }
        return result
    }
}
