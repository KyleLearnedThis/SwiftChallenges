//
//  UniquePaths.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/8/22.
//  https://leetcode.com/problems/unique-paths-iii/

import Foundation


class UniquePaths {
    // https://leetcode.com/problems/unique-paths-iii/discuss/1553873/Java-Easy-Solution-oror-DFS-%2B-Backtracking-oror-Explanation-(Simplified)
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var zero = 0 // Count the 0's
        var sx = 0 // starting x index
        var sy = 0 // starting y index
        var grid = grid

        for r in 0 ..< grid.count { // r = row
            for c in 0 ..< grid[0].count { // c = column
                // if current cell is 0, count it.
                if grid[r][c] == 0 {
                    zero += 1
                } else if grid[r][c] == 1 {
                    sx = r // starting x co-ordinate
                    sy = c // starting y co-ordinate
                }
            }
        }

        return dfs(&grid, sx, sy, &zero)
    }

    func dfs(_ grid: inout [[Int]], _ x: Int, _ y: Int, _ zero: inout Int) -> Int {

        // Base condition
        if x < 0 || y < 0 || x >= grid.count || y >= grid[0].count || grid[x][y] == -1 {
            return 0
        }

        if grid[x][y] == 2 {
            /* Why zero = -1, because in above example we have 9 zero's. So, when we reach the final cell we are covering one cell extra then the zero count. If that's the case we find the path and return '1' otherwise return '0
             */
            return zero == -1 ? 1 : 0
        }

        grid[x][y] = -1 // mark the visited cells as -1
        zero -= 1 // and reduce the zero by 1

        // calculating all the paths available in 4 directions
        let totalPaths = dfs(&grid, x + 1, y, &zero) +
        dfs(&grid, x - 1, y, &zero) +
        dfs(&grid, x, y + 1, &zero) +
        dfs(&grid, x, y - 1, &zero)

        // Let's say if we are not able to count all the paths. Now we use Backtracking over here
        grid[x][y] = 0
        zero += 1

        return totalPaths
    }
}
