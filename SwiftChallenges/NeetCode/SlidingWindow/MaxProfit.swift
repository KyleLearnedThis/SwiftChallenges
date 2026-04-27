//
//  MaxProfit.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/19/26.
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

import Foundation

class MaxProfit {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count >= 2 else { return 0 }
        var maxProfit = 0
        var l = 0
        var r = 1
        
        while r < prices.count {
            if prices[l] < prices[r] {
                let curProfit = prices[r] - prices[l]
                maxProfit = max(maxProfit, curProfit)
            } else {
                l = r // you found the new low
            }
            r = r + 1
        }
        return maxProfit
    }
}
