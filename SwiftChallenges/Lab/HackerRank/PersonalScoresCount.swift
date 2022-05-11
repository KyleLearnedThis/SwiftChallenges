//
//  PersonalScoresCount.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/10/22.
//  https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem?isFullScreen=true

import Foundation

class PersonalScoresCount {
    static func breakingRecords(scores: [Int]) -> [Int] {
        var bestScore = -1
        var worstScore = -1

        var bestScoreCount = 0
        var worstScoreCount  = 0

        for (i,score) in scores.enumerated() {
            if i == 0 {
                bestScore = score
                worstScore = score
            } else {
                if score > bestScore {
                    bestScore = score
                    bestScoreCount += 1
                }

                if score < worstScore {
                    worstScore = score
                    worstScoreCount += 1
                }
            }
        }
        return [bestScoreCount, worstScoreCount]
    }
}
