//
//  DegreeOfArray.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 3/16/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/degree-of-an-array/

import Foundation

class DegreeOfArray {
    static func findShortestSubArray(_ nums: [Int]) -> Int {
        let freq = makeFrequencyMap(nums)
        let entries: Array<(key: Int, value: Int)> = freq.sorted { $0.1 > $1.1 }
        let entry = entries[0]
        let value = entry.value
        let topDegreeList = entries.filter { $0.value == value}
        var min = Int.max
        for item in topDegreeList {
            let cur = minArraySize(nums, degree: item.key)
            if min > cur {
                min = cur
            }
        }
        return min
    }

    static func makeFrequencyMap(_ input: [Int]) -> [Int:Int] {
        var map = Dictionary<Int, Int>()
        input.forEach{ i in
            let value = map[i, default: 0] + 1
            map[i] = value
        }
        return map
    }

    static func minArraySize(_ nums: [Int], degree: Int) ->  Int {
        let l = nums.firstIndex(of: degree)!
        let r = nums.lastIndex(of: degree)!
        return r - l + 1
    }
}
