//
//  SubrectangleQueries.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/23/22.
//  https://leetcode.com/problems/subrectangle-queries/

import Foundation

class SubrectangleQueries {
    var rectangle: [[Int]]
    init(_ rectangle: [[Int]]) {
        self.rectangle = rectangle
    }

    func updateSubrectangle(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int, _ newValue: Int) {
        for i in row1 ... row2 {
            for j in col1 ... col2 {
                rectangle[i][j] = newValue
            }
        }
    }

    func getValue(_ row: Int, _ col: Int) -> Int {
        return rectangle[row][col]
    }
}
