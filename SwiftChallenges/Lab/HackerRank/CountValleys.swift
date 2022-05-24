//
//  CountValleys.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/24/22.
//  https://www.hackerrank.com/challenges/counting-valleys/problem?isFullScreen=true

import Foundation

class CountValleys {
    func countingValleys(steps: Int, path: String) -> Int {
        var result = 0
        let input = Array(path)
        var height = 0
        var trail = [Int]()
        for ch in input {
            if ch == "U" {
                height += 1
            } else if ch == "D" {
                if height == 0 {
                    result += 1
                }
                height -= 1
            }
            trail.append(height)
        }
        return result
    }
}
