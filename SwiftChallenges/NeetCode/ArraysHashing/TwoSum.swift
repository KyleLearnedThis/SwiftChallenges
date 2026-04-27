//
//  TwoSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/12/22.
//  https://leetcode.com/problems/two-sum/


class TwoSum {
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }
            dict[num] = i
        }
        return [-1,-1]
    }

    static func twoSums(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                let pair = [lastIndex, i]
                result.append(pair)
            }
            dict[num] = i
        }
        return result
    }

    // https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
    func findTarget(_ root: TreeNode<Int>?, _ k: Int) -> Bool {
        var nums: [Int] = []
        var cache: [Int: Bool] = [:]

        traverse(root, nums: &nums)

        for (_, num) in nums.enumerated() {
            if cache[k - num] != nil {
                return true
            }
            cache[num] = true
        }

        return false
    }

    private func traverse(_ tree: TreeNode<Int>?, nums: inout [Int]) {
        guard let tree = tree else { return }
        nums.append(tree.data)
        traverse(tree.left, nums: &nums)
        traverse(tree.right, nums: &nums)
    }
}
