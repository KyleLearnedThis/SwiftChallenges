//
//  FindDuplicateNumber.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/27/26.
//  https://leetcode.com/problems/find-the-duplicate-number/
//  Floyd's algorithm application in Array.
//  This needs n + 1 elements and value has be in index range

class FindDuplicateNumber {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]
        
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        
        slow = nums[0]
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
}
