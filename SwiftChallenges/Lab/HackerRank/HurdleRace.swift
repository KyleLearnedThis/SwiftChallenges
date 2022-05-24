//
//  HurdleRace.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/24/22.
//  https://www.hackerrank.com/challenges/the-hurdle-race/problem?isFullScreen=true

import Foundation

class HurdleRace {
    func hurdleRace(k: Int, height: [Int]) -> Int {
        var maxDiff = 0

        for h in height {
            let cur = h - k
            if cur > 0 && cur > maxDiff {
                maxDiff = cur
            }
        }
        return maxDiff
    }
}
