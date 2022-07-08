//
//  AscendingArray.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/8/22.
//  https://leetcode.com/problems/non-decreasing-array/

import Foundation

class AscendingArray {
    func checkPossibility(_ n: [Int]) -> Bool {
        var val = 0, len = n.count
        for i in 0..<len-1 where n[i] > n[i+1] {
            val += 1
            if val > 1 || i > 0 && i < len-2 && (n[i-1] > n[i+1] && n[i] > n[i+2]) {
                return false
            }
        }
        return val <= 1
    }
}
