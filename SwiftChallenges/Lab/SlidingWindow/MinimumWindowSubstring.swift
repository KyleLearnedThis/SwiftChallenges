//
//  MinimumWindowSubstring.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/19/26.
//  https://leetcode.com/problems/minimum-window-substring/

class MinimumWindowSubstring {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !t.isEmpty else { return "" }

        var freq = [Character: Int]()
        var window = [Character: Int]()
        t.forEach { freq[$0, default: 0] += 1 }

        var have = 0
        let need = freq.keys.count
        var l = 0
        var resL = -1, resR = -1
        var minLen = Int.max
        let S = Array(s)

        for r in S.indices {
            let c = S[r]
            window[c, default: 0] += 1

            // just met the required count for c
            if window[c] == freq[c] { have += 1 }

            while have == need {
                // found a valid window — track if it's the smallest
                if r - l + 1 < minLen {
                    minLen = r - l + 1
                    resL = l; resR = r
                }
                // shrink from the left
                let left = S[l]
                window[left]! -= 1
                if window[left]! < freq[left, default: 0] { have -= 1 }
                l += 1
            }
        }

        guard resL != -1 else { return "" }
        return String(S[resL...resR])
    }
}
