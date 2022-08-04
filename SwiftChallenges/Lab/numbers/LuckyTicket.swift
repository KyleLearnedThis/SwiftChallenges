//
//  LuckyTicket.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/3/22.
//  CodeSignal isLucky

import Foundation

class LuckTicket {
    static func isLucky(n: Int) -> Bool {
        let str = String(describing: n)
        let input = Array(str).map {Int(String($0))!}
        let count = input.count
        let mid = count / 2

        let l = Array(input[0..<mid])
        let r = Array(input[mid...])
        let sum1 = l.reduce(0,+)
        let sum2 = r.reduce(0,+)
        return sum1 == sum2
    }
}
