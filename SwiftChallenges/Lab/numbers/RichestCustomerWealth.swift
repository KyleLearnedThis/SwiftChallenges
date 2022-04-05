//
//  RichestCustomerWealth.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/richest-customer-wealth/

import Foundation

class RichestCustomerWealth {
    static func maximumWealth(_ accounts: [[Int]]) -> Int {
        var result = [Int]()
        for i in 0 ..< accounts.count {
            let wealth = accounts[i].reduce(0, +)
            result.append(wealth)
        }
        result = result.sorted()
        return result.last!
    }
}
