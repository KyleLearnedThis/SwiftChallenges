//
//  RotateImage.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/26.
//  https://leetcode.com/problems/rotate-image/

// Rotate an N×N matrix 90° clockwise, in place.
//
// Time:  O(n²) — every one of the n² cells is moved exactly once.
// Space: O(1) — swaps happen in place; only a single temp value is held.
class RotateImage {

    func rotate(_ matrix: inout [[Int]]) {
        // Peel the matrix in concentric square layers from the outside in.
        // `left`/`right` are the column (and, since it's square, the row)
        // bounds of the current layer. When they meet, the center is done.
        var left = 0
        var right = matrix.count - 1

        while left < right {
            let top = left       // top row index of this layer
            let bottom = right   // bottom row index of this layer

            // Walk the top edge left→right. Each `i` picks the four corners
            // of one inscribed "diamond" and spins them 90° clockwise.
            // right - left is the number of elements to rotate in this layer.
            for i in 0 ..< right - left {
                // Save the top corner so it isn't overwritten, then pull each
                // slot from the one 90° counter-clockwise of it:
                // top ← left ← bottom ← right ← (saved top).
                let topLeft = matrix[top][left + i]
                matrix[top][left + i] = matrix[bottom - i][left]      // ↖ ← ↙
                matrix[bottom - i][left] = matrix[bottom][right - i]  // ↙ ← ↘
                matrix[bottom][right - i] = matrix[top + i][right]    // ↘ ← ↗
                matrix[top + i][right] = topLeft                      // ↗ ← ↖
            }

            // Shrink to the next inner layer.
            right = right - 1
            left = left + 1
        }
    }
}
