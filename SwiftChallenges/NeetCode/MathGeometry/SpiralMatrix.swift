//
//  SpiralMatrix.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/13/26.
//  https://leetcode.com/problems/spiral-matrix/

// Read an m×n matrix in spiral order (right → down → left → up), peeling
// one boundary layer per lap.
//
// Time:  O(m·n) — every cell is visited and appended exactly once.
// Space: O(1) extra — only the four boundary indices (output array aside).
class SpiralMatrix {

    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        // Four walls of the not-yet-visited region. They close inward:
        // l/r are the left/right columns, t/d the top/down (bottom) rows.
        var l = 0
        var r = matrix[0].count - 1
        var t = 0
        var d = matrix.count - 1

        // Loop while the window still encloses at least one cell.
        while l <= r && t <= d {
            // Top row, left → right. Then that row is consumed, so drop it.
            for i in l...r {
                result.append(matrix[t][i])
            }
            t = t + 1

            // Right column, top → bottom (from the new top t, not t+1).
            // Guard: after t++ the window may already be empty vertically;
            // t...d would be an inverted range and Swift traps on that.
            if t > d { break }
            for i in t...d {
                result.append(matrix[i][r])
            }
            r = r - 1

            // Bottom row, right → left. Guard against a now-empty window
            // horizontally (single-row layers finish here).
            if l > r { break }
            for i in (l...r).reversed() {
                result.append(matrix[d][i])
            }
            d = d - 1

            // Left column, bottom → top. Guard again: single-column layers
            // finish here, so t...d could be inverted.
            if t > d { break }
            for i in (t...d).reversed() {
                result.append(matrix[i][l])
            }

            l = l + 1
        }

        return result
    }
}
