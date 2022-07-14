//
//  StickCut.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/13/22.
//  https://www.hackerrank.com/challenges/cut-the-sticks/problem?isFullScreen=true

import Foundation

class StickCut {
    static func cutTheSticks(arr: [Int]) -> [Int] {
        var result = [Int]()
        var input = arr.map{$0}
        while input.count >= 1 {
            let min = input.min()!
            let temp = input.filter {$0 != min}.map {
                $0 - min
            }
            let diff = input.count
            input = temp
            result.append(diff)
        }
        return result
    }
}
