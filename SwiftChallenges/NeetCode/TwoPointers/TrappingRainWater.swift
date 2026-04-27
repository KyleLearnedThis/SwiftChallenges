//
//  TrappingRainWater.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/26/26.
//  https://leetcode.com/problems/trapping-rain-water/

class TrappingRainWater {
    func trap(_ height: [Int]) -> Int {
        var res = 0
        var l = 0
        var r = height.count - 1
        // running max from each side — water at any position is bounded by min(leftMax, rightMax)
        var leftMax = height[l]
        var rightMax = height[r]

        while l < r {
            if leftMax < rightMax {
                l = l + 1
                leftMax = max(leftMax, height[l]) // track tallest wall seen from the left
                res = res + (leftMax - height[l]) // leftMax is the bottleneck, so water = leftMax - current height
            } else {
                r = r - 1
                rightMax = max(rightMax, height[r]) // track tallest wall seen from the right
                res = res + (rightMax - height[r])
            }
        }
        return res
    }
}
