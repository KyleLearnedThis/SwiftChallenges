//
//  NeetWordSearch.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/19/26.
//  https://leetcode.com/problems/word-search/

// Strategy: DFS + backtracking. Try every cell as a starting point; recursively
// explore all 4 neighbors. Mark visited cells in-place to avoid reuse, then
// restore them on the way back up (backtrack).
//
// Time:  O(m * n * 4^L)  — m*n starting cells, each branching up to 4 ways for L chars
// Space: O(L)             — recursion depth equals word length (no extra data structures)
class NeetWordSearch {

    func existsWithoutSet(_ board: [[Character]], _ word: String) -> Bool {
        var board = board  // local copy so we can mutate for visited-marking
        let rows = board.count
        let cols = board[0].count
        let chars = Array(word)  // O(1) index access vs String subscript
        // i = index of the character in `word` we're currently trying to match
        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            // Base case: matched every character — word found
            if i == chars.count { return true }
            // Pruning: out of bounds, or current cell doesn't match next needed char
            // (board[r][c] == "#" is also caught here since "#" ≠ any letter)
            if r < 0 ||
                r >= rows ||
                c < 0 ||
                c >= cols ||
                board[r][c] != chars[i] {
                return false
            }
            // Mark visited by overwriting with a sentinel that can't appear in a word
            let tmp = board[r][c]
            board[r][c] = "#"
            // Explore all 4 directions; short-circuits as soon as any path succeeds
            let found = dfs(r+1, c, i+1) ||
            dfs(r-1, c, i+1) ||
            dfs(r, c+1, i+1) ||
            dfs(r, c-1, i+1)
            // Backtrack: restore cell so other starting points can use it
            board[r][c] = tmp
            return found
        }
        // Try every cell as a potential start of the word
        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(r, c, 0) { return true }
            }
        }
        return false
    }

    // Alternative: same algorithm but tracks visited cells in a Set instead of
    // mutating the board. Trade-off: board stays immutable (no var copy needed),
    // but visited lookup/insert/remove are O(1) with a small constant overhead,
    // and Space grows to O(L) for the set on top of O(L) for the call stack.
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        let chars = Array(word)
        var visited = Set<[Int]>()  // stores [r, c] pairs for cells on the current path

        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i == chars.count { return true }
            if r < 0 ||
                r >= rows ||
                c < 0 ||
                c >= cols ||
                board[r][c] != chars[i] ||
                visited.contains([r, c]) {  // replaces the "#" sentinel check
                return false
            }
            visited.insert([r, c])  // mark before recursing
            let found = dfs(r+1, c, i+1) ||
                dfs(r-1, c, i+1) ||
                dfs(r, c+1, i+1) ||
                dfs(r, c-1, i+1)
            visited.remove([r, c])  // unmark on the way back up (backtrack)
            return found
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(r, c, 0) { return true }
            }
        }
        return false
    }
}
