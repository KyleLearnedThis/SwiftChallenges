//
//  RomanNumerals.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/7/22.
//

import Foundation


class RomanNumerals {
    private let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]

    // https://leetcode.com/problems/roman-to-integer/
    func romanToInt(_ s: String) -> Int {
        var prev = 0
        var result = 0
        for i in s {
            let val = dict[i, default: 0]

            var temp = 0
            if val <= prev {
                temp = prev
            } else {
                temp = -prev
            }
            result += temp
            prev = val
        }
        result += prev
        return result
    }

    private let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    private let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

    // https://leetcode.com/problems/integer-to-roman/
    func intToRoman(_ num: Int) -> String {
        var cur = num
        var result = ""

        while cur > 0 {
            for (i, value) in values.enumerated() where cur - value >= 0 {
                cur -= value
                result += symbols[i]
                break
            }
        }
        return result
    }
}
