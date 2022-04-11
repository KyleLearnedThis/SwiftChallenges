//
//  SpiralTraversal.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/9/22.
//

import Foundation

class SpiralTraversal {
    static func traversal(_ input: [[Int]]) -> [Int] {
        var result = [Int]()

        if input.isEmpty && input.first!.isEmpty {
            return result
        }

        var d = input.count
        var r = input.first!.count
        var i: Int
        var u = 0
        var l = 0

        /**
         * u - starting row index
         * d - ending row index
         * l - starting column index
         * r - ending column index
         * i - iterator
         **/

        while (u < d) && (l < r) {
            i = l
            /* Print the first row from the remaining rows */
            while i < r {
                result.append(input[u][i])
                i+=1
            }
            u+=1

            /* Print the last column from the remaining columns */
            i = u
            while i < d {
                result.append(input[i][r - 1])
                i+=1
            }
            r-=1

            /* Print the last row from the remaining rows */
            if u < d {
                i = r - 1
                while i >= l {

                    // System.out.print(" " + matrix[d - 1][i]);
                    result.append(input[d - 1][i])
                    i-=1
                }
                d-=1
            }

            /* Print the first column from the remaining columns */
            if l < r {
                i = d - 1
                while i >= u {
                    result.append(input[i][l])
                    i-=1
                }
                l+=1
            }
        }

        return result
    }
}
