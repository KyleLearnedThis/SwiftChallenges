//
//  TriangularSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/23/22.
//  https://leetcode.com/problems/find-triangular-sum-of-an-array/

import Foundation


class TriangularSum {
    static func sum(_ nums: [Int]) -> Int {
        var answer = nums
        while answer.count > 1 {
            var temp = [Int]()
            for i in 0 ..< answer.count-1 {
                let l = answer[i]
                let r = answer[i+1]
                temp.append((l+r)%10)
            }
            answer = temp
        }
        return answer.first!
    }

    static func sumV2(_ nums: [Int]) -> Int {
        var nums = nums
        var j = 0
        var step = nums.count
        while (step > 1) {
            for i in stride(from: 1, to: nums.count - j, by: 1) {
                nums[i-1] = (nums[i-1] + nums[i]) % 10
            }
            j += 1
            step -= 1
        }
        return nums[0]
    }
}
