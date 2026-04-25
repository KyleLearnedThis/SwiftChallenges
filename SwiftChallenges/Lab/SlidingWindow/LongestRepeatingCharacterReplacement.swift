//
//  LongestRepeatingCharacterReplacement.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/25/26.
//  https://leetcode.com/problems/longest-repeating-character-replacement/

class LongestRepeatingCharacterReplacement {
    
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var res = 0
        var frequency: [Character: Int] = [:] // count of each char in the current window
        var l = 0
        let S = Array(s)

        for r in S.indices {
            // expand window by including S[r]
            frequency[S[r], default: 0] += 1

            // replacements needed = window size - count of the most frequent char
            // if that exceeds k, the window is invalid — shrink from the left
            let currentWindow = r - l + 1
            while currentWindow - (frequency.values.max() ?? 0) > k {
                frequency[S[l], default: 0] -= 1
                l += 1
            }

            // window is now valid; record its length
            res = max(res, currentWindow)
        }
        return res
    }
    
    func characterReplacementV2(_ s: String, _ k: Int) -> Int {
        var res = 0
        var frequency: [Character: Int] = [:] // count of each char in the current window
        var l = 0
        let S = Array(s)
        var maxFrequency: Int = 0

        for r in S.indices {
            // expand window and track the highest frequency seen so far
            frequency[S[r], default: 0] += 1
            maxFrequency = max(maxFrequency, frequency[S[r], default: 0])

            // if the window is invalid, shift it right by one (never shrink — window only grows)
            // maxFrequency may be stale but that's fine: a stale high value just means we don't
            // grow until a char catches up, which is correct

            if (r - l + 1) - maxFrequency > k {
                frequency[S[l], default: 0] -= 1
                l += 1
            }

            // window is now valid; record its length
            res = max(res, r - l + 1)
        }
        return res
    }
}
