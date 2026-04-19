//
//  LongestConsecutive.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/18/26.
//

class LongestConsecutive {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        var longestStreak = 0
        
        for num in set {
            if !set.contains(num - 1) {
                var currentNum = num
                var currentStreak = 1
                
                while set.contains(currentNum + 1) {
                    currentNum += 1
                    currentStreak += 1
                }
                longestStreak = max(longestStreak, currentStreak)
            }
        }
        return longestStreak
    }
}
