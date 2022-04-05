//
//  DuplicateNumber.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/15/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/find-the-duplicate-number/

import Foundation

class DuplicateNumber {
    static func findDuplicate(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            if !set.contains(num) {
                set.insert(num)
            } else {
                return num
            }
        }
        return 0
    }
}
