//
//  ClimbStairs.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/2/22.
//  https://leetcode.com/problems/climbing-stairs/

import Foundation

class ClimbStairs {
    var map: [Int: Int] = [:]
    func climbStairs(_ n: Int) -> Int {
        if let val = map[n] {
            return val
        }
        if n == 0 {
            return 1
        }
        if n < 0 {
            return 0
        }
        map[n] = climbStairs(n-1) + climbStairs(n-2)
        return map[n] ?? 0
    }

    func climbStairsV2(_ n: Int) -> Int {
        var map: [Int: Int] = [:]
        map[0] = 1
        map[1] = 1
        if(n == 0 || n == 1) {
            return map[n]!
        } else {
            for i in 2 ... n {
                let x = map[i-1]! + map[i-2]!
                map[i] = x
            }
        }
        return map[n]!
    }
}
