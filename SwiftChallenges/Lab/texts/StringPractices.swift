//
//  StringPractices.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class StringPractices {
    static func reverse01(_ input: String) -> String {
        var result = ""
        Array(input).forEach { ch in
            result.insert(ch, at: result.startIndex)
        }
        return result
    }

    func reverse02(_ s: inout [Character]) {
        var i = 0
        var j = s.count - 1

        while (j > i) {
            s.swapAt(i, j)
            i = i + 1
            j = j - 1
        }
    }

    static func toLowerCase(_ str: String) -> String {
        var result = ""
        for i in str.indices {
            let ch = str[i]
            result.append(ch.lowercased())
        }
        return result
    }

    static func removeOutermostParentheses(_ S: String) -> String {
        let x = S.firstIndex(of: "(")!
        let start = S.index(x, offsetBy: 1)
        let end = S.lastIndex(of: ")")!
        let sub = S[start..<end]
        let result = String(sub)
        return result
    }

    // https://leetcode.com/problems/rotate-string/
    static func rotateString(_ s: String, _ goal: String) -> Bool {
        let source = Array(s)

        for i in source.indices {
            let pivot = source.index(source.startIndex, offsetBy: i+1)
            let left = String(source[0 ..< pivot])
            let right = String(source[pivot...])
            let word = right + left
            if word == goal {
                return true
            }
        }
        return false
    }

    // https://practice.geeksforgeeks.org/problems/remove-duplicates3034/1
    static func removeDuplicates(_ s: String) -> String {
        let chars = Array(s)
        var set = Set<Character>()
        var store = [String]()
        for ch in chars {
            if !set.contains(ch) {
                set.insert(ch)
                store.append(String(ch))
            }
        }
        let result = store.joined()
        return result
    }
}
