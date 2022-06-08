//
//  UniqueDigits.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/7/22.
//  https://www.geeksforgeeks.org/numbers-unique-distinct-digits/

import Foundation

class UniqueDigits {
    // Note: this solution worked withs small to medium data
    func range(low: Int, high: Int) -> [Int] {
        var result = [Int]()
        for num in low...high {
            let digits = Array(String(num))
            let set = Set(digits)
            if set.count == digits.count {
                result.append(num)
            }
        }
        return result
    }

    func rangeV2(low: Int, high: Int) -> [Int] {
        var result = [Int]()
        for num in low...high {
            result.append(num)
        }
        result = result.filter { Set(Array(String($0))).count == Array(String($0)).count }
        return result
    }
}
