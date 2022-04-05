//
//  HeightChecker.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/height-checker/

import Foundation

class HeightChecker {
    static func heightChecker(_ heights: [Int]) -> Int {
        var result = 0
        let sorted = heights.sorted()
        for i in heights.indices {
            if heights[i] != sorted[i] {
                result = result + 1
            }
        }
        return result
    }
}
