//
//  BetweenTwoSets.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/22/22.
//  https://www.hackerrank.com/challenges/between-two-sets/problem?isFullScreen=true
//  https://studyalgorithms.com/array/hackerrank-between-two-sets/
//  Time Complexity O(n*log(n))
//  Space Complexity O(log(n))

import Foundation

class BetweenTwoSets {
    func getTotalX(a: [Int], b: [Int]) -> Int {
        var result = 0

        // Get LCM of all elements of a
        var lcm = a.first!
        for i in a {
            lcm = getLCM(lcm, i)
        }

        // Get GCD of all elements of b
        var gcd = b.first!
        for j in b {
            gcd = getGCD(gcd, j)
        }

        // Count multiples of lcm that divide the gcd
        var multiple = 0
        while multiple < gcd {
            multiple += lcm
            if gcd % multiple == 0 {
                result += 1
            }
        }

        return result
    }

    func getGCD(_ n1: Int, _ n2: Int) -> Int {
        if n2 == 0 {
            return n1
        }
        return getGCD(n2, n1 % n2)
    }

    func getLCM(_ n1: Int, _ n2: Int) -> Int {
        if n1 == 0 || n2 == 0 {
            return 0
        } else {
            let gcd = getGCD(n1, n2)
            return abs(n1 * n2) / gcd
        }
    }
}
