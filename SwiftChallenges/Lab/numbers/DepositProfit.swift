//
//  DepositProfit.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/8/22.
//

import Foundation


class DepositProfit {
    static func calculate(deposit: Int, rate: Int, threshold: Int) -> Int {
        var sum = deposit
        for i in 1...200 {
            sum = sum + ((sum * rate) / 100)
            if threshold <= sum {
                return i
            }
        }
        return 0
    }
}
