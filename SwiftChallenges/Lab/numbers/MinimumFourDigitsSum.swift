//
//  MinimumFourDigitsSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/15/22.
//

import Foundation

class MinimumFourDigitsSum {
    static func minimumSum(_ num: Int) -> Int {
        let input = Array(String(num))
            .map {
                Int(String($0))!
            }.sorted()
        let firstString = "\(input[0])\(input[2])"
        let secondString = "\(input[1])\(input[3])"
        let first = Int(firstString)!
        let second = Int(secondString)!
        return first + second
    }
}
