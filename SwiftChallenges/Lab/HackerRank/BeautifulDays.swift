//
//  BeautifulDay.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/13/22.
//  https://www.hackerrank.com/challenges/beautiful-days-at-the-movies/problem?isFullScreen=true

import Foundation

class BeautifulDays {
    static func beautifulDays(i: Int, j: Int, k: Int) -> Int {
        var result = 0
        for num in i ... j {
            let hold = String(String(num).reversed())
            let reverse = Int(hold)!
            let diff = abs(reverse - num)
            if diff % k == 0 {
                result += 1
            }
        }
        return result
    }
}
