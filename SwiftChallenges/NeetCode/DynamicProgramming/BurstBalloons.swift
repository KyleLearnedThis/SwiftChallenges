//
//  BurstBalloons.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/8/26.
//  https://leetcode.com/problems/burst-balloons/

/// Time complexity: O(n^3), where n is `nums.count`. We fill an (n+2) x (n+2)
/// `dp` table indexed by (left, right) boundary pairs, and for each pair we try
/// every `k` strictly between them as the "last balloon burst" in that range —
/// O(n^2) pairs times O(n) choices of `k`.
/// Space complexity: O(n^2) for the `dp` table (plus the padded O(n) balloons array).
///
/// `maxCoins` (bottom-up) vs `maxCoinsV2` (top-down DFS + memo):
/// - DFS + memo is the easier one to write and memorize: it's a near-literal
///   transcription of the recurrence — "pick the last balloon burst in this
///   range, recurse on the two halves, cache it" — with no separate mental
///   step for iteration order.
/// - Bottom-up requires reasoning about iteration order (shorter windows
///   before longer ones, so `length` must be the outer loop), which is an
///   extra thing to get right under pressure and a common source of bugs
///   (off-by-one ranges, wrong loop nesting).
/// - The base case is trivial in DFS (`left + 1 == right` -> 0 coins), while
///   bottom-up encodes it implicitly by leaving those cells at their default 0.
/// - Rule of thumb for interval DP (burst balloons, matrix chain
///   multiplication, palindrome partitioning, etc.): write the DFS + memo
///   version first; convert to bottom-up later only if you need to shave off
///   recursion-stack overhead or iterative code is required.
class BurstBalloons {

    func maxCoins(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }

        // Pad with virtual balloons of value 1 on both ends so every burst,
        // including the first and last real balloon, has well-defined neighbors.
        var balloons = [1]
        balloons.append(contentsOf: nums)
        balloons.append(1)
        let n = balloons.count

        // dp[left][right] = max coins obtainable by bursting every balloon
        // strictly between indices `left` and `right`, leaving `left` and
        // `right` themselves intact as the eventual neighbors.
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        // Build up by increasing window length so dp[left][k] and dp[k][right]
        // are already computed when we need them for dp[left][right].
        for length in 2..<n {
            for left in 0..<(n - length) {
                let right = left + length
                // Try every balloon `k` in (left, right) as the LAST one burst
                // in this window: once it's the last, `left` and `right` are
                // its neighbors, so bursting it yields balloons[left] * balloons[k] * balloons[right].
                for k in (left + 1)..<right {
                    let coins = dp[left][k] + balloons[left] * balloons[k] * balloons[right] + dp[k][right]
                    dp[left][right] = max(dp[left][right], coins)
                }
            }
        }

        return dp[0][n - 1]
    }

    /// Time complexity: O(n^3) — same as `maxCoins`, but built top-down instead
    /// of bottom-up. Each of the O(n^2) (left, right) pairs is solved once
    /// (thanks to `memo`) by trying O(n) choices of `k` as the last balloon burst.
    /// Space complexity: O(n^2) for `memo` plus O(n) recursion depth on the call stack.
    func maxCoinsV2(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }

        // Pad with virtual balloons of value 1 on both ends, same as maxCoins.
        var balloons = [1]
        balloons.append(contentsOf: nums)
        balloons.append(1)
        let n = balloons.count

        // memo[left][right] caches the max coins for bursting everything
        // strictly between `left` and `right`. -1 means "not yet computed".
        var memo = Array(repeating: Array(repeating: -1, count: n), count: n)

        func dfs(_ left: Int, _ right: Int) -> Int {
            // No balloons left to burst in this window.
            if left + 1 == right { return 0 }
            if memo[left][right] != -1 { return memo[left][right] }

            var best = 0
            // Pick `k` as the last balloon burst in (left, right); its
            // neighbors at that moment are `left` and `right`.
            for k in (left + 1)..<right {
                let coins = dfs(left, k) + balloons[left] * balloons[k] * balloons[right] + dfs(k, right)
                best = max(best, coins)
            }

            memo[left][right] = best
            return best
        }

        return dfs(0, n - 1)
    }
}
