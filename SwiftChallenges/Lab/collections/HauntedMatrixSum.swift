//
//  HauntedMatrixSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/3/22.
//  CodeSignal matrixElementsSum

import Foundation

class HauntedMatrixSum {
    func matrixElementsSum(matrix: [[Int]]) -> Int {
        var a = matrix
        for i in 0..<(a.count - 1) {
            for j in 0..<a[i].count {
                if a[i][j] < 1 {
                    for k in (i+1) ..< a.count {
                        a[k][j] = 0
                    }
                }
            }
        }

        var r = 0
        for i in 0..<a.count {
            for j in 0..<a[i].count {
                r += a[i][j]
            }
        }
        return r
    }
}
