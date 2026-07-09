//
//  EditDistance.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/7/26.
//  https://leetcode.com/problems/edit-distance/

class EditDistance {

    func minDistance(_ word1: String, _ word2: String) -> Int {
        let w1 = Array(word1)
        let w2 = Array(word2)
        let m = w1.count
        let n = w2.count

        // dp[i][j] = min edits to turn the first i chars of w1 into the first j chars of w2.
        // Grid is (m+1) x (n+1) so we have a row/column for the "empty prefix" case.
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        // Base cases: turning "" into w2[0..<j] takes j inserts.
        // Turning w1[0..<i] into "" takes i deletes.
        for i in 0...m { dp[i][0] = i }
        for j in 0...n { dp[0][j] = j }

        guard m > 0, n > 0 else { return max(m, n) }

        // dp[i][j] looks backward at its three neighbors and picks the cheapest:
        //   diagonal dp[i-1][j-1] -> replace (cost +1), or a free match if the chars are equal
        //   down     dp[i-1][j]   -> delete w1[i-1]                (cost +1)
        //   right    dp[i][j-1]   -> insert w2[j-1]                (cost +1)
        // The diagonal is the only move that can skip the +1 entirely.
        for i in 1...m {
            for j in 1...n {
                if w1[i - 1] == w2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = 1 + min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1]))
                }
            }
        }

        return dp[m][n]
    }
}
