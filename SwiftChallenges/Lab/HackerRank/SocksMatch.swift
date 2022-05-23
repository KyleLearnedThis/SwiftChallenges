//
//  SocksMatch.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/22/22.
//  https://www.hackerrank.com/challenges/sock-merchant/problem?isFullScreen=true

import Foundation

class SocksMatch {
    static func sockMerchant(n: Int, ar: [Int]) -> Int {
        var socks = [Int:Int]()
        for num in ar {
            let value = socks[num, default: 0] + 1
            socks[num] = value
        }
        let list = socks.filter{ $0.value >= 2 }
        var result = 0
        for item in list {
            let value = item.value / 2
            result += value
        }
        return result
    }
}
