//
//  ThreeSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/25/26.
//  https://leetcode.com/problems/3sum/description/

class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let N = nums.sorted()
        
        for (i, v) in N.enumerated() {
            // Same value, problem asked no dupilate, so skip ahead.
            if i > 0 && v == N[i-1] {
                continue
            }
            // Because we already sorted input array, we can turn this
            // into Two Sum II problem on sub array next to i.
            var l = i + 1
            var r = N.count - 1
            while l < r {
                let threeSum = v + N[l] + N[r]
                if threeSum > 0 {
                    r = r - 1
                } else if threeSum < 0 {
                    l = l + 1
                } else {
                    result.append([v, N[l], N[r]])
                    l = l + 1
                    // if next element is the same, skip ahead.
                    while l < r && N[l] == N[l-1] {
                        l = l + 1
                    }
                }
            }
        }
        return result
    }
}
