//
//  Palindrome.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 3/15/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/valid-palindrome/

import Foundation

class Palindrome {
    static func isPalindrome(_ s: String) -> Bool {
        let pattern = "[^A-Za-z0-9]+"
        let input = s.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
            .lowercased()
        let revsersed = String(input.reversed())
        return revsersed == input
    }

    static func isPalindromeV2(_ s: String) -> Bool {
        let pattern = "[^A-Za-z0-9]+"
        let input = s.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
            .lowercased()
        let arr = Array(input)
        let size = arr.count
        for i in 0 ... (size / 2) {
            let l = arr[i]
            let r = arr[size - i - 1]
            if l != r {
                return false
            }
        }
        return true
    }

    // https://leetcode.com/problems/longest-palindrome/
    static func longestPalindrome(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        var result = s.count
        var dict = [Character:Int]()

        s.forEach{ ch in
            let value = dict[ch, default: 0] + 1
            dict[ch] = value
        }

        var oddFound = false
        for (_,v) in dict {
            if v % 2 == 1 {
                if !oddFound {
                    oddFound = true
                } else {
                    result -= 1
                }
            }
        }
        return result
    }
}
