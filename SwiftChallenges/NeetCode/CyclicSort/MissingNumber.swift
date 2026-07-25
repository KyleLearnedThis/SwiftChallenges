//
//  MissingNumber.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/25/26.
//  https://leetcode.com/problems/missing-number/

class MissingNumber {

    func missingNumber(_ nums: [Int]) -> Int {
        let sums = nums.reduce(0, +)
        let total = (0...nums.count).reduce(0, +)
        let result = total - sums
        return result
    }
}
