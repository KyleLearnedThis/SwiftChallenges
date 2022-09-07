//
//  AvoidObstacles.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/6/22.
//  avoidObstacles

import Foundation

class AvoidObstacles {
    func calucateMinHopSize(inputArray: [Int]) -> Int {
        var result = 0
        for i in 0 ... 1000 {
            let div = i + 1
            let cur = inputArray.filter {$0 % div == 0}.count
            if cur == 0 {
                result = div
                break
            }
        }
        return result
    }

}
