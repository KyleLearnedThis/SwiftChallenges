//
//  ReverseOnlyLetters.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class ReverseOnlyLetters {
    static func reverseOnlyLetters(_ S: String) -> String {
        var stack = Array<Character>()
        let charArray = Array(S)
        for ch in charArray {
            if ch.isLetter {
                stack.append(ch)
            }
        }

        var ans = ""
        charArray.forEach { ch in
            if ch.isLetter {
                let ltr = stack.popLast()!
                ans = ans + String(ltr)
            } else {
                ans = ans + String(ch)
            }
        }

        return ans
    }
}
