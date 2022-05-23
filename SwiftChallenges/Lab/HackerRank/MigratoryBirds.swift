//
//  MigratoryBirds.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/22/22.
//  https://www.hackerrank.com/challenges/migratory-birds/problem?isFullScreen=true

import Foundation

class MigratoryBirds {
    static func migratoryBirds(arr: [Int]) -> Int {
        var frequency = [Int: Int]()
        // Make freuqncy map
        for i in arr {
            let value = frequency[i, default: 0] + 1
            frequency[i] = value
        }

        // Sort by descending frequency value
        let list = frequency.sorted { $0.value > $1.value }

        // Eliminate dups and get smallest key
        let max = list.first!.value
        let result = list.filter{$0.value == max}.first!.key
        return result
    }
}
