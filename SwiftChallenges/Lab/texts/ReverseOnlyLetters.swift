//
//  ReverseOnlyLetters.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class ReverseOnlyLetters {
    static func reverseOnlyLetters(_ S: String) -> String {
        var letters = Array<Character>()
        for c in Array(S) {
            if c.isLetter {
                letters.append(c)
            }
        }

        var ans = ""
        for c in Array(S) {
            if c.isLetter {
                ans = ans + String(letters.popLast()!)
            } else {
                ans = ans + String(c)
            }
        }

        return ans
    }
}
