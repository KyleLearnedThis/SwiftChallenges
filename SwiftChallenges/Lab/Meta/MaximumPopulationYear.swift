//
//  MaximumPopulationYear.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/2/22.
//  https://leetcode.com/problems/maximum-population-year/

import Foundation

class MaximumPopulationYear {
    func maximumPopulation(_ logs: [[Int]]) -> Int {
        var map = [Int: Int]()
        let listByBirth = logs.sorted { (a,b) -> Bool in
            return a.first! < b.first!
        }

        for item in listByBirth {
            let birth = item.first!
            let death = item.last!

            let inc = map[birth, default: 0] + 1
            map[birth] = inc
            let dec = map[death + 1, default: 0] - 1
            map[death + 1] = dec
        }
        let populationIncrement = map.sorted(by: {(a, b) -> Bool in
            return a.key < b.key
        })

        var population = [(Int, Int)]()
        var number = 0

        for item in populationIncrement {
            let year = item.key
            number += item.value
            population.append((year, number))
        }

        let sortedResult = population.sorted(by: { (a,b) -> Bool in
            return a.0 < b.0
        })

        var maxValue = Int.min

        for item in sortedResult {
            let count = item.1
            if count > maxValue {
                maxValue = count
            }
        }

        let entry = sortedResult.filter{ (a:Int, b:Int) -> Bool in
            return b == maxValue
        }.first!

        return entry.0
    }

    func minBirthYear(_ logs: [[Int]]) -> Int {
        let minValue = logs.min(by: { (a, b) -> Bool in
            return a.first! < b.first!
        })
        return minValue!.first!
    }

    func maxDeathYear(_ logs: [[Int]]) -> Int {
        let maxValue = logs.max(by: { (a, b) -> Bool in
            return a.last! < b.last!
        })
        return maxValue!.last!
    }
}
