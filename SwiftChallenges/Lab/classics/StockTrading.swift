//
//  StockTrading.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/10/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://www.geeksforgeeks.org/stock-buy-sell/

import Foundation

class StockTrading {
    static func maxProfit(price: [Int]) -> Int {
        let n = price.count
        var cost = 0
        var maxCost = 0

        if n == 0 {
            return 0
        }

        var minimum = price[0]

        for i in 0 ..< n {
            minimum = min(minimum, price[i])
            cost = price[i] - minimum
            maxCost = max(maxCost, cost)
        }
        return maxCost
    }
}
