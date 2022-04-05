//
//  SingleNumber.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/single-number/

import Foundation

class SingleNumber {
    public func singleNumber(_ nums: [Int]) -> Int {
        var current: Int
        if nums.count >= 2 {
            current = nums[0]
            for i in 1..<nums.count {
                current = current ^ nums[i]
            }
        } else {
            current = nums[0]
        }
        return current
    }
}
