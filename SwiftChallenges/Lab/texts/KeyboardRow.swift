//
//  KeyboardRow.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/2/22.
//  https://leetcode.com/problems/keyboard-row/

import Foundation

class KeyboardRow {
    static func findWords(_ words: [String]) -> [String] {
        let top = Set("qwertyuiop")
        let mid = Set("asdfghjkl")
        let low = Set("zxcvbnm")
        var results = [String]()

        for word in words {
            let set = Set(word.lowercased())
            if set.isSubset(of: top) || set.isSubset(of: mid) || set.isSubset(of: low) {
                results.append(word)
            }
        }
        return results
    }
}
