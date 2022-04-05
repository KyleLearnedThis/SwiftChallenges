//
//  DailyTemperatures.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class DailyTemperatures {
    /// Basic implementation
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var result = Array<Int>()
        let count = T.count
        if count >= 2 {
            for i in 0..<count{
                let value = nextWarmDay(T, now: i)
                result.append(value)
            }
        } else if count == 1{
            return [0]
        }
        return result
    }

    func nextWarmDay(_ T: [Int], now: Int) -> Int {
        let count = T.count
        let cur = T[now]
        for i in now + 1 ..< count {
            let next = T[i]
            if next > cur {
                return i - now
            }
        }
        return 0
    }
}
