//
//  AlienDictionary.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/27/26.
//

// 269. Alien Dictionary
//
// There is a new alien language that uses the English alphabet. However, the
// order of the letters is unknown to you.
//
// You are given a list of strings words from the alien language's dictionary,
// where the strings in words are sorted lexicographically by the rules of
// this new language.
//
// Return a string of the unique letters in the new alien language sorted in
// lexicographically increasing order by the new language's rules. If there is
// no solution, return "". If there are multiple solutions, return any of them.
//
// Example 1:
//   Input:  words = ["wrt","wrf","er","ett","rftt"]
//   Output: "wertf"
//
// Example 2:
//   Input:  words = ["z","x"]
//   Output: "zx"
//
// Example 3:
//   Input:  words = ["z","x","z"]
//   Output: ""
//   Explanation: The order is invalid, so return "".
//
// Constraints:
//   - 1 <= words.length <= 100
//   - 1 <= words[i].length <= 100
//   - words[i] consists of only lowercase English letters.

class AlienDictionary {

    // Derives the alien character ordering using post-order DFS topological sort.
    //
    // 1. Build an adjacency list by seeding every unique character, then comparing
    //    each adjacent word pair to extract a "comes before" edge from the first
    //    differing character. If a longer word is a prefix of the shorter one that
    //    follows it, the input is invalid — return "".
    //
    // 2. Run post-order DFS over every character. The visit map encodes three states:
    //      absent  → not yet visited
    //      true    → currently on the DFS call stack (a revisit means a cycle)
    //      false   → fully processed and already appended to result
    //    Appending after all neighbors are resolved (post-order) means result ends
    //    up in reverse topological order; reversing it at the end gives the answer.
    //
    // Time:  O(N * M) — N words, M max word length; the DFS is O(V + E) but V and E
    //        are bounded by the alphabet size (≤ 26), so word scanning dominates.
    // Space: O(V + E) — adjacency list, visit map, result, and DFS call stack are all
    //        proportional to the number of unique characters and edges (≤ 26 and 26²).
    func alienOrder(_ words: [String]) -> String {
        // Seed every unique character so chars with no edges still appear in output
        var adj = [Character: Set<Character>]()
        for word in words {
            for c in word { if adj[c] == nil { adj[c] = [] } }
        }

        // Extract one ordering edge per adjacent word pair
        for i in 0..<words.count - 1 {
            let w1 = Array(words[i])
            let w2 = Array(words[i + 1])
            let minLen = min(w1.count, w2.count)
            // The problem guarantees words are sorted in alien order, so a longer word
            // appearing before its own prefix directly contradicts that guarantee
            if w1.count > w2.count && w1.prefix(minLen) == w2.prefix(minLen) {
                return ""
            }
            for j in 0..<minLen where w1[j] != w2[j] {
                adj[w1[j]]!.insert(w2[j])
                break
            }
        }

        // absent = unvisited, true = in current path (cycle if revisited), false = done
        var visit = [Character: Bool]()
        var result = [Character]()

        // Returns false if a cycle is detected, true otherwise.
        // Appends c to result after all its neighbors are processed (post-order),
        // so result ends up in reverse topological order.
        func dfs(_ c: Character) -> Bool {
            if let inPath = visit[c] {
                return !inPath
            }
            visit[c] = true
            for neighbor in adj[c]! {
                if !dfs(neighbor) {
                    return false
                }
            }
            visit[c] = false
            result.append(c) // post-order: append after all descendants are resolved
            return true
        }

        for c in adj.keys {
            if !dfs(c) { return "" }
        }

        return String(result.reversed())
    }
}
