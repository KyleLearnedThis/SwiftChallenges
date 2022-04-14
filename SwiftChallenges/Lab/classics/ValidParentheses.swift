//
//  ValidParentheses.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class ValidParentheses {
    static func isValid(_ input: String) -> Bool {
        var stack = [String]()
        for i in input.indices {
            let s = String(input[i])
            if s == "(" {
                stack.append(s)
            } else if s == ")" {
                if stack.count == 0 {
                    return false
                }
                stack.removeLast()
            }
        }
        return stack.isEmpty
    }

    // Balanced Brackets
    static func isBalanced(s: String) -> Bool {
        var stack = [Character]()
        let input = Array(s)
        for ch in input {
            if ch == "{" || ch == "(" || ch == "[" {
                stack.append(ch)
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    let cr = stack.removeLast()
                    if ch == "}" && cr != "{" {
                        return false
                    } else if ch == ")" && cr != "(" {
                        return false
                    } else if ch == "]" && cr != "[" {
                        return false
                    }
                }
            }
        }
        return stack.isEmpty
    }
}
