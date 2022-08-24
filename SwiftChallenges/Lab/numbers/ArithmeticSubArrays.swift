//
//  ArithmeticSubArrays.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/24/22.
//  https://leetcode.com/problems/arithmetic-subarrays/

import Foundation

class ArithmeticSubArrays {
    static func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        var result = [Bool]()

        for i in l.indices {
            let x = l[i]
            let y = r[i]
            let slice = Array(nums[x...y]).sorted()

            var j = 0
            var cur = slice[j]
            var next = slice[j+1]
            let diff = next - cur

            while j < slice.count - 1 {
                cur = slice[j]
                next = slice[j+1]
                if next - cur != diff {
                    result.append(false)
                    break
                }
                if j == slice.count - 2 {
                    result.append(true)
                }
                j += 1
            }
        }
        return result
    }
}
