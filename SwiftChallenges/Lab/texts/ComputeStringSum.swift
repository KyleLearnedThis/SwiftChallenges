//
//  ComputeStringSum.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 1/19/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//  https://www.reddit.com/r/dailyprogrammer/comments/onfehl/20210719_challenge_399_easy_letter_value_sum/
//
import Foundation

class ComputeStringSum {
    static func calculateSum(_ input: String) -> Int {
        if input == "" {
            return 0
        }
        let chars = Array(input.lowercased())
        let sum = chars.map { ch -> Int in
            Int(ch.asciiValue!) - 96
        }.reduce(0, +)
        return sum
    }
}
