//
//  MineSweeper.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/7/22.
//

import Foundation

class MineSweeper {
   static func generateMatrix(matrix: [[Bool]]) -> [[Int]] {
        let col = matrix[0].count
        let row = matrix.count
        var result = [[Int]]()
        for _ in 0..<row {
            var temp = [Int]()
            for _ in 0..<col {
                temp.append(0)
            }
            result.append(temp)
        }

        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == true {
                    if j-1 >= 0 {
                        let value = result[i][j-1] + 1
                        result[i][j-1] = value
                    }

                    if j+1 < col {
                        let value = result[i][j+1] + 1
                        result[i][j+1] = value
                    }

                    if i-1 >= 0 {
                        let value = result[i-1][j] + 1
                        result[i-1][j] = value
                    }

                    if i+1 < row {
                        let value = result[i+1][j] + 1
                        result[i+1][j] = value
                    }

                    if i-1 >= 0 && j-1 >= 0 {
                        let value = result[i-1][j-1] + 1
                        result[i-1][j-1] = value
                    }

                    if i-1 >= 0 && j+1 < col {
                        let value = result[i-1][j+1] + 1
                        result[i-1][j+1] = value
                    }

                    if i+1 < row && j-1 >= 0 {
                        let value = result[i+1][j-1] + 1
                        result[i+1][j-1] = value
                    }

                    if i+1 < row && j+1 < col {
                        let value = result[i+1][j+1] + 1
                        result[i+1][j+1] = value
                    }
                }
            }
        }

        return result
    }
}
