//
//  ReshapeMatrix.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/13/22.
//  https://leetcode.com/problems/reshape-the-matrix/

import Foundation

class ReshapeMatrix {
    static func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let h = mat.count
        let v = mat[0].count
        if h * v == r * c {
            var result = [[Int]]()
            let items = mat.flatMap{$0}
            var low = -1
            var high = -1
            for i in 0 ..< r {
                low = i * c
                high = i * c + c
                let segment = Array(items[low..<high])
                result.append(segment)
            }
            return result
        } else {
            return mat
        }
    }
}
