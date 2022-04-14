//
//  RevenueMilestones.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/14/22.
//

import Foundation

class RevenueMilestones {
    static func getMilestoneDays(_ revenues: [Int], _ milestones: [Int]) -> [Int] {
        var result = [Int]()
        for milestone in milestones {
            var sum = 0
            for (i, revenue) in revenues.enumerated() {
                sum += revenue
                if sum >= milestone {
                    // 0th index is first day
                    result.append(i+1)
                    break
                }
            }
        }

        return result
    }
}
