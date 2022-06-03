//
//  Trie.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/3/22.
//  https://www.raywenderlich.com/892-swift-algorithm-club-swift-trie-data-structure

import Foundation

class Trie {
    var root: TrieNode<Character>

    init(root: TrieNode<Character> = TrieNode<Character>(value: "-")){
        self.root = root
    }

    init() {
        self.root = TrieNode<Character>(value: "-")
    }
}

extension Trie {
    func insert(word: String) {
        guard !word.isEmpty else { return }
        var cur = root
        let characters = Array(word)
        var curIndex = 0

        while curIndex < characters.count {
            let ch = characters[curIndex]
            if let child = cur.children[ch] {
                cur = child
            } else {
                cur.add(child: ch)
                cur = cur.children[ch]!
            }
            curIndex += 1
        }

        if curIndex == characters.count {
            cur.isTerminating = true
        }
    }

    func contains(word: String) -> Bool {
        guard !word.isEmpty else { return false }

        var cur = root
        let characters = Array(word) // Array(word.lowercased())
        var curIndex = 0

        while curIndex < characters.count {
            let ch = characters[curIndex]
            if let child = cur.children[ch] {
                curIndex += 1
                cur = child
            } else {
                return false
            }
        }
        if curIndex == characters.count && cur.isTerminating {
            return true
        } else {
            return false
        }
    }
}
