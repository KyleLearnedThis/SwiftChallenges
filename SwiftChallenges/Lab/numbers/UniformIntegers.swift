//
//  UniformIntegers.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/20/22.
//  Return count of uniform numbers in a range (number is uniform if it has all same characters)

import Foundation

class UniformIntegers {

    static func getUniformIntegerCountInInterval(_ A: Int,
                                                 _ B: Int,
                                                 _ closure: (([Character])->Bool)
    ) -> Int {
        var result = 0
        for num in A...B {
            if (0...9).contains(num) {
                result += 1
                continue
            }
            let cur = Array(String(num))
            if closure(cur) {
                result += 1
            }
        }
        return result
    }

    static func isUniformV1(_ cur: [Character]) -> Bool {
        let first = cur.first!
        let count = cur.count
        let same = cur.filter{$0 == first}.count
        if same == count {
            return true
        } else {
            return false
        }
    }

    static func isUniformV2(_ cur: [Character]) -> Bool {
        return cur.dropFirst().allSatisfy({ $0 == cur.first })
    }
}
