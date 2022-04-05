//
//  RunningSumArray.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 1/27/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/running-sum-of-1d-array/

import Foundation

class RunningSumArray {
    static func runningSum(_ nums: [Int]) -> [Int] {
        var result = nums
        if result.count <= 1 {
            return result
        }
        for i in result.indices {
            if i != result.count - 1 {
                let curVal = result[i]
                result[i+1] = result[i+1] + curVal
            }
        }
        return result
    }
}
