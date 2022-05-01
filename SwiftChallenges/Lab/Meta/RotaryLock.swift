//
//  RotaryLock.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/30/22.
//

import Foundation

class RotaryLock {
    static func getMinCodeEntryTime(_ N: Int, _ M: Int, _ C: [Int]) -> Int {
        let base = N
        var seconds = 0
        var cur = 1
        for num in C {
            let left: Int = abs(num - cur)
            let right: Int = abs(num - (cur + base))
            let small = min(left, right)
            seconds += small
            cur = num
        }
        return seconds
    }
}
