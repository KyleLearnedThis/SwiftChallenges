//
//  LargestRectangleHistogram.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/26.
//  https://leetcode.com/problems/largest-rectangle-in-histogram/

class LargestRectangleHistogram {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        // Stack stores (startIndex, height). Kept in increasing height order.
        // startIndex = how far left this bar's rectangle can extend.
        var stack: [(startIndex: Int, height: Int)] = []

        for (i, height) in heights.enumerated() {
            // When we see a shorter bar, every taller bar in the stack can no longer
            // extend rightward — calculate their max area now before discarding them.
            var startIndex = i
            // As long as the stack's top bar is taller than the current bar, pop it and calculate its area.
            while let top = stack.last, top.height > height {
                stack.removeLast()
                // Width = distance from where this bar started to the current (shorter) bar
                let area = top.height * (i - top.startIndex)
                maxArea = max(maxArea, area)
                // The current shorter bar can reach back to where this taller bar started
                startIndex = top.startIndex
            }
            stack.append((startIndex: startIndex, height: height))
        }

        // Bars still in the stack were never blocked on the right, so they extend to the end
        for bar in stack {
            let area = bar.height * (heights.count - bar.startIndex)
            maxArea = max(maxArea, area)
        }

        return maxArea
    }
}
