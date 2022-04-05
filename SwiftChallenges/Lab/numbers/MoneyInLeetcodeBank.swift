//
//  MoneyInLeetcodeBank.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 1/31/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/calculate-money-in-leetcode-bank/

import Foundation

class MoneyInLeetcodeBank {

    static func totalMoney(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var sum = 0
        for i in 1...n {
            let weeklyBase = weeks(i)
            let day = ((i - 1) % 7) + 1
            let today = weeklyBase + day - 1
            // print("[\(today)] ", terminator: " ")
            sum += today
        }
        return sum
    }

    static func weeks(_ n: Int) -> Int {
        return Int((n - 1 + 7) / 7)
    }
}
