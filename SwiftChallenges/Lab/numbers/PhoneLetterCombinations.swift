//
//  PhoneLetterCombinations.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/14/22.
//  https://leetcode.com/problems/letter-combinations-of-a-phone-number/

import Foundation

class PhoneLetterCombinations {
    // Iterative
    static func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 { return [] }
        var res = [""]

        let dict: [Character : String] =
        ["2" : "abc",
         "3" : "def",
         "4" : "ghi",
         "5" : "jkl",
         "6" : "mno",
         "7" : "pqrs",
         "8" : "tuv",
         "9" : "wxyz"]

        for digit in digits {
            if let letters = dict[digit] {
                let temp = res
                res.removeAll()
                for s in temp {
                    for letter in letters {
                        res.append(s+String(letter))
                    }
                }
            }
        }
        return res
    }

    // Recursive
    static func letterCombinationsV2(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        let maps: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        var strings = [String]()
        for d in digits {
            if let s = maps[d] {
                strings.append(s)
            }
        }
        var combinations = [String]()
        letterCombinations(0, strings, "", &combinations)
        return combinations
    }

    static private func letterCombinations(_ index: Int, _ strings: [String], _ carry: String, _ combinations: inout [String]) {
        if index >= strings.count {
            combinations.append(carry)
            return
        }

        for c in strings[index] {
            letterCombinations((index+1), strings, (carry + String(c)), &combinations)
        }
    }
}
