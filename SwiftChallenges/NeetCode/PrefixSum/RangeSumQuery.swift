//
//  RangeSumQuery.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/4/26.
//  https://leetcode.com/problems/range-sum-query-immutable/

class RangeSumQuery {
    private let nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return nums[left...right].reduce(0,+)
    }
}
