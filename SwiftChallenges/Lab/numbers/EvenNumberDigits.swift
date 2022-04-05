//
//  EvenNumberDigits.swift
//  SwiftCodes
//  https://leetcode.com/problems/find-numbers-with-even-number-of-digits/
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import Foundation

class EvenNumberDigits {
    static func findNumbers(_ nums: [Int]) -> Int {
        let sum = nums.filter{ Array(String($0)).count % 2 == 0 }
            .map{ _ in return 1 }
            .reduce(0,+)
        return sum
    }
}
