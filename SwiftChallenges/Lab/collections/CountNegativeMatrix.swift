//
//  CountNegativeMatrix.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 7/20/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/

import Foundation

class CountNegativeMatrix {
    static func countNegatives(_ grid: [[Int]]) -> Int {
        var sum = 0
        for arr in grid {
            let temp = arr.filter{$0 < 0}
                .map{_ in Int(1)}
                .reduce(0, +)
            sum += temp
        }
        return sum
    }
}
