//
//  CoinChange.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/5/26.
//

// ============================================================
// V1 — Bottom-up DP (Claude)
// ============================================================
// INTUITION: Build up answers for every sub-amount 0…amount.
// To make change for X, try each coin and ask:
//   "What if I use this coin? Then I need dp[X - coin] more coins."
// Take the minimum across all coins.
//
// MEMORY AID: "dp[i] = fewest coins to make amount i"
//
// TIME:  O(amount × coins.count)
// SPACE: O(amount)

// ============================================================
// V2 — Bottom-up DP (NeetCode style, translated from Python)
// ============================================================
// INTUITION (NeetCode's mental model):
//
//   Step 1 — Brute force / decision tree
//     At each node of a tree you decide: which coin to use next?
//     Every path from root to a "0-remaining" leaf is a valid solution.
//     This is O(coins^amount) — way too slow.
//
//   Step 2 — Notice repeated sub-problems
//     Different branches of the tree reach the same remaining amount.
//     e.g. coins=[1,2,3], amount=4:
//       pick 1 then 3  →  remaining=0  ✓
//       pick 3 then 1  →  remaining=0  ✓  (same sub-problem!)
//     Cache the answer the first time you compute it.
//
//   Step 3 — Flip it bottom-up (avoid recursion overhead)
//     Instead of top-down recursion + cache, pre-fill a dp array
//     from 0 up to amount.  Each cell reuses already-computed cells.
//
// KEY LINES (exactly what NeetCode codes in Python, now in Swift):
//   var dp = Array(repeating: amount + 1, count: amount + 1)
//   dp[0] = 0
//   for a in 1...amount { for c in coins { if c <= a { dp[a] = min(dp[a], 1 + dp[a - c]) } } }
//   return dp[amount] != amount + 1 ? dp[amount] : -1
//
// TIME:  O(amount × coins.count)
// SPACE: O(amount)

class CoinChange {

    // V1 — my own bottom-up style
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {

        // Use amount+1 as "infinity" — it's impossible to need more coins
        // than the amount itself (you'd never need >amount 1-coins).
        let infinity = amount + 1

        // dp[i] = minimum coins needed to make exactly amount i.
        // Start every entry as "impossible" except dp[0].
        var dp = Array(repeating: infinity, count: amount + 1)

        // Base case: zero coins are needed to make amount 0.
        dp[0] = 0

        // Guard: 1...0 is an invalid range in Swift and would crash.
        guard amount > 0 else { return 0 }

        // Fill dp[1] through dp[amount] one sub-problem at a time.
        for i in 1...amount {
            for coin in coins {
                // Can only use this coin if it doesn't exceed the current amount.
                if coin <= i {
                    // Option A: don't use this coin → dp[i] (current best)
                    // Option B: use this coin once → 1 + dp[i - coin]
                    dp[i] = min(dp[i], 1 + dp[i - coin])
                }
            }
        }

        // If dp[amount] is still "infinity", no combination of coins works.
        return dp[amount] == infinity ? -1 : dp[amount]
    }

    // V2 — NeetCode's bottom-up style (direct Swift translation of his Python)
    func coinChangeV2(_ coins: [Int], _ amount: Int) -> Int {

        // Initialize every slot to amount+1 ("infinity").
        // NeetCode's reasoning: you'll never need more than `amount` coins,
        // so amount+1 is safely unreachable — and no overflow risk.
        var dp = Array(repeating: amount + 1, count: amount + 1)

        // dp[0] = 0: base case — making change for 0 requires 0 coins.
        dp[0] = 0

        // Guard: 1...0 is an invalid range in Swift and would crash.
        guard amount > 0 else { return 0 }

        // Outer loop: solve every sub-amount from 1 up to the target.
        // Think of `a` as "how much do I still need to make?"
        for a in 1...amount {

            // Inner loop: try every coin denomination.
            for c in coins {

                // Only valid if this coin doesn't overshoot the current amount.
                if c <= a {
                    // "If I use coin c once, I already solved dp[a - c].
                    //  So the total cost is 1 + dp[a - c]."
                    // Keep the minimum across all coin choices.
                    dp[a] = min(dp[a], 1 + dp[a - c])
                }
            }
        }

        // NeetCode's exact return logic:
        // If dp[amount] is still "infinity", the amount is unreachable → return -1.
        return dp[amount] != amount + 1 ? dp[amount] : -1
    }
}
