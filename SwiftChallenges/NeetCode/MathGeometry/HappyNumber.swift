//
//  HappyNumber.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/26.
//  https://leetcode.com/problems/happy-number/

class HappyNumber {

    func isHappy(_ n: Int) -> Bool {
        var seen = Set<Int>()
        var current = n
        while current != 1 {
            let temp = Array(String(current))
            let digits = temp.map { $0.wholeNumberValue! * $0.wholeNumberValue! }
            current = digits.reduce(0, +)
            if seen.contains(current) {
                return false
            }
            seen.insert(current)
        }
        return true
    }
}
