//
//  NeetWordLadder.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/14/26.
//  https://leetcode.com/problems/word-ladder/

// MARK: - Problem
// Given a beginWord, endWord, and wordList, return the number of words in the
// shortest transformation sequence from beginWord → endWord where:
//   • Each step changes exactly one letter
//   • Every intermediate word must exist in wordList
// Return 0 if no such sequence exists.
//
// Example: "hit" → "hot" → "dot" → "dog" → "cog"  →  returns 5

class NeetWordLadder {

    // MARK: - V1: BFS — generate neighbours on-the-fly (try every a–z swap)
    //
    // BFS naturally finds the shortest path in an unweighted graph.
    // Each "word" is a node; two words are connected by an edge if they differ
    // by exactly one letter AND both exist in the word set.
    //
    // Key insight: instead of building the full graph up-front (expensive),
    // generate neighbours on-the-fly by trying every letter a–z at every position.
    // This is O(word_length × 26) per word instead of O(|wordList|²) comparisons.
    //
    // Time:  O(N × M × 26)  where N = wordList.size, M = word length
    // Space: O(N)            for the word set and BFS queue

    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // Use a Set for O(1) membership tests and fast removal.
        // Removing a word once it's been enqueued prevents revisiting
        // the same word via a longer path (acts as the "visited" set).
        var wordSet = Set(wordList)

        // Early exit: if endWord isn't reachable at all, skip the search.
        guard wordSet.contains(endWord) else { return 0 }

        // BFS queue — each element is a word at the current depth level.
        // steps starts at 1 because beginWord itself counts as one word
        // in the sequence (LeetCode counts nodes, not edges).
        var queue = [beginWord]
        var steps = 1

        while !queue.isEmpty {
            // We're entering a new level, so the sequence length grows by 1.
            steps += 1
            var nextLevel: [String] = []

            // Process every word at the current BFS level before going deeper.
            for word in queue {
                var chars = Array(word) // work on a mutable character array

                for i in chars.indices {
                    let original = chars[i]

                    // Try replacing position i with every letter a–z.
                    for letter in "abcdefghijklmnopqrstuvwxyz" {
                        guard letter != original else { continue } // skip no-op

                        chars[i] = letter
                        let candidate = String(chars)

                        // Found the endWord — return immediately (shortest path).
                        if candidate == endWord { return steps }

                        // If candidate is in the word set, it's a valid next hop.
                        // Remove it so later BFS levels can't use a longer path to it.
                        if wordSet.contains(candidate) {
                            wordSet.remove(candidate)
                            nextLevel.append(candidate)
                        }
                    }

                    chars[i] = original // restore before moving to next position
                }
            }

            queue = nextLevel // advance to the next BFS level
        }

        // Exhausted all reachable words without finding endWord.
        return 0
    }

    // MARK: - V2: BFS — pre-built pattern adjacency map (NeetCode video approach)
    //
    // Instead of trying all 26 letters at runtime, we preprocess the word list
    // into a pattern → [words] map. A pattern is a word with one position
    // replaced by "*". Two words that share a pattern differ by exactly one letter.
    //
    // Example:  "hot" produces patterns ["*ot", "h*t", "ho*"]
    //           "dot" produces patterns ["*ot", "d*t", "do*"]
    //           Both share "*ot", so they are neighbours.
    //
    // This trades preprocessing work for cheaper neighbour lookup during BFS —
    // especially useful when the alphabet is large or words are long.
    //
    // Preprocessing: O(N × M)  — N words, each has M patterns of length M
    // BFS:           O(N × M)  — each word/pattern pair visited at most once
    // Space:         O(N × M)  — for the pattern map

    func ladderLengthWildcardAdjacency(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else { return 0 }

        // Build pattern → [word] adjacency map.
        // All words that share a pattern are one-letter-change neighbours.
        var patternMap: [String: [String]] = [:]
        let allWords = [beginWord] + wordList // beginWord may not be in wordList

        for word in allWords {
            var chars = Array(word)
            for i in chars.indices {
                let original = chars[i]
                chars[i] = "*"
                let pattern = String(chars)
                patternMap[pattern] = (patternMap[pattern] ?? []) + [word]
                chars[i] = original // restore for the next position
            }
        }

        // Standard BFS — visited set prevents re-enqueuing a word via a longer path.
        var visited = Set<String>([beginWord])
        var queue = [beginWord]
        var steps = 1

        while !queue.isEmpty {
            steps += 1
            var nextLevel: [String] = []

            for word in queue {
                var chars = Array(word)
                for i in chars.indices {
                    let original = chars[i]
                    chars[i] = "*"
                    let pattern = String(chars)
                    chars[i] = original

                    // All neighbours of `word` share this pattern.
                    for neighbour in patternMap[pattern] ?? [] {
                        if neighbour == endWord {
                            return steps
                        }
                        guard !visited.contains(neighbour) else { continue }
                        visited.insert(neighbour)
                        nextLevel.append(neighbour)
                    }
                }
            }

            queue = nextLevel
        }

        return 0
    }
}
