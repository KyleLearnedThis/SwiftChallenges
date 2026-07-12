//
//  NeetSingleNumber.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/26.
//  https://leetcode.com/problems/single-number/

class NeetSingleNumber {

    func singleNumber(_ nums: [Int]) -> Int {
        var result: Int = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}
