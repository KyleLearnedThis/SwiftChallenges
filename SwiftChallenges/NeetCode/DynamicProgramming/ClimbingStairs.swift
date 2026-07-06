//
//  ClimbingStairs.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/30/26.
//  https://leetcode.com/problems/climbing-stairs/

class ClimbingStairs {
    
    func climbStairs(_ n: Int) -> Int {
        var one = 1
        var two = 1
        for _ in 0..<n - 1 {
            var temp = one
            one = one + two
            two = temp
        }
        return one
    }
}
