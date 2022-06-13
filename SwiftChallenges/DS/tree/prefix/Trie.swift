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
    }

    func contains(word: String) -> Bool {
        guard !word.isEmpty else { return false }

        var cur = root
        let characters = Array(word)
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

    func getPrefix(word: String) -> TrieNode<Character>? {
        var i = 0
        var cur: TrieNode<Character>? = root
        let input = Array(word)

        while cur != nil && i < input.count {
            let ch = input[i]
            cur = cur?.children[ch]
            i += 1
        }
        return cur
    }

    func getPrefixString(node: TrieNode<Character>?) -> String {
        var cur = node
        var result = ""
        while cur != nil && cur?.parent != nil {
            let v = String(describing: cur!.data)
            cur = cur?.parent
            result = v + result
        }
        print("")
        return result
    }

    func getAllPaths(node: TrieNode<Character>?) -> [String] {
        var path = [Character]()
        var paths = [[Character]]()
        var result = [String]()

        if node == nil {
            return result
        }

        let cur: TrieNode<Character>? = node
        let prefix = getPrefixString(node: cur)
        getAllPathsDFS(node: cur, path: &path, paths: &paths)

        for array in paths {
            var input = ""
            for ch in array {
                input.append(ch)
            }
            result.append(prefix+input)
        }
        return result
    }

    func getAllPathsDFS(node: TrieNode<Character>?, path: inout [Character], paths: inout [[Character]]) {
        let cur = node

        if cur == nil {
            return
        } else {
            var clone = [Character]()
            if cur!.isTerminating {
                paths.append(path)
                return
            }
            let children = cur!.children
            for child in children {
                let k = child.key
                let n = child.value
                clone = path.map{$0}
                clone.append(k)
//                print("=== p: [\(cur!.data)] n: [\(n.data)] ===")
                getAllPathsDFS(node: n, path: &clone, paths: &paths)
            }
        }
    }
}
