//
//  PerfectNumber.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 3/18/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/perfect-number/

import Foundation

class PerfectNumber {
    static func checkPerfectNumber(_ num: Int) -> Bool {
        if num == 1 {
            return false
        }
        var divisors = Array<Int>()
        for i in 1 ..< num - 1 {
            if num % i == 0 {
                divisors.append(i)
            }
        }
        let sum = divisors.reduce(0, +)
        return sum == num
    }
}
