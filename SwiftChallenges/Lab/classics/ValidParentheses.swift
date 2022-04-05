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
        return stack.count == 0
    }
}
