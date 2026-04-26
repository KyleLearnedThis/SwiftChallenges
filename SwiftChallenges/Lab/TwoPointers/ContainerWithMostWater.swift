//
//  ContainerWithMostWater.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/26/26.
//  https://leetcode.com/problems/container-with-most-water/

class ContainerWithMostWater {
    // Brute force
    func maxAreaBasic(_ height: [Int]) -> Int {
        var maxArea: Int = 0
        for l in 0..<height.count {
            for r in l+1..<height.count {
                let width = r - l
                let height = min(height[l], height[r])
                let area = height * width
                maxArea = max(maxArea, area)
            }
        }
        return maxArea
    }

    func maxArea(_ height: [Int]) -> Int {
        var maxArea: Int = 0
        var l: Int = 0
        var r: Int = height.count - 1
        while l < r {
            let w = r - l
            let h = min(height[l], height[r])
            let area = w * h
            maxArea = max(maxArea, area)
            
            if height[l] < height[r] {
                l = l + 1
            } else {
                r = r - 1
            }
        }
        return maxArea
    }
}
