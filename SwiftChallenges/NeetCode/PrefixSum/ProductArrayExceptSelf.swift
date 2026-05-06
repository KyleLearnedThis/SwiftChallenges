//
//  ProductArrayExceptSelf.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/5/26.
//  https://leetcode.com/problems/product-of-array-except-self/

// Strategy: two-pass prefix/suffix products, O(n) time, O(1) extra space.
//
// For each index i, the answer is:
//   (product of everything to the LEFT of i) * (product of everything to the RIGHT of i)
//
// Example: nums = [1, 2, 3, 4]
//   left products:  [1,  1,  2,  6 ]   (nothing left of index 0, so 1)
//   right products: [24, 12, 4,  1 ]   (nothing right of index 3, so 1)
//   result:         [24, 12, 8,  6 ]
//
// We avoid a separate array for the right side by doing a second pass in reverse,
// accumulating the right product into a single variable and multiplying it directly
// into result[i].
class ProductArrayExceptSelf {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = [Int](repeating: 1, count: n)

        // Left pass: result[i] = product of nums[0..<i]
        var leftRunningProduct = 1
        for i in 0..<n {
            result[i] = leftRunningProduct
            leftRunningProduct *= nums[i]
        }

        // Right pass: multiply result[i] by product of nums[(i+1)...]
        var rightRunningProduct = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            result[i] *= rightRunningProduct
            rightRunningProduct *= nums[i]
        }

        return result
    }
}
