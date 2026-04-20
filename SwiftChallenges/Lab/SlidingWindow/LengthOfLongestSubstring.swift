//
//  LengthOfLongestSubstring.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/19/26.
//  https://leetcode.com/problems/longest-substring-without-repeating-characters/

import Foundation

class LengthOfLongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let input = Array(s)
        guard input.count > 0 else { return 0 }

        var set = Set<Character>()
        var max = 0
        var l = 0

        for r in input.indices {
            while set.contains(input[r]) {
                set.remove(input[l])
                l = l + 1
            }
            set.insert(input[r])
            max = Swift.max(r - l + 1, max)
        }
        return max
    }
}
