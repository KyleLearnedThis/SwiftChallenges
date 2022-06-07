//
//  NumberOfIslands.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/7/22.
//  https://leetcode.com/problems/number-of-islands/

import Foundation

class NumberOfIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        guard grid[0].count > 0 else { return 0 }
        var result = 0
        var matrix = grid

        for i in matrix.indices {
            for j in matrix[0].indices {
                if matrix[i][j] == "1" {
                    result += 1
                    changeElement(&matrix, i, j)
                }
            }
        }

        return result
    }

    func changeElement(_ matrix: inout [[Character]],_ i: Int,_ j: Int) {
        guard (0 ..< matrix.count).contains(i),
              (0 ..< matrix[0].count).contains(j),
              matrix[i][j] == "1"
        else { return }

        matrix[i][j] = "0"
        changeElement(&matrix, i + 1, j)
        changeElement(&matrix, i - 1, j)
        changeElement(&matrix, i, j + 1)
        changeElement(&matrix, i, j - 1)
    }
}
