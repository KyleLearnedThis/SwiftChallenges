//
//  ReverseParentheses.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/3/22.
//  https://leetcode.com/problems/reverse-substrings-between-each-pair-of-parentheses/

import Foundation

class ReverseParentheses {
    static func reverseParentheses(_ s: String) -> String {
        var stack = [Character]()
        for str in s {
            if str == ")" {
                // reverse until we see ")"
                var reverse = [Character]()
                while stack.last != "(" {
                    let ch = stack.removeLast()
                    reverse.append(ch)
                }
                stack.removeLast() // remove ")"
                stack += reverse
            } else {
                stack.append(str)
            }
        }
        return String(stack)
    }
}
