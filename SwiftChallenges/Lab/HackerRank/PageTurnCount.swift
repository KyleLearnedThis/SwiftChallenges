//
//  PageTurnCount.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/23/22.
//  https://www.hackerrank.com/challenges/drawing-book/problem?isFullScreen=true

import Foundation

class PageTurnCount {
    static func pageCount(n: Int, p: Int) -> Int {
        var turn = 0
        var pace = 0
        var cur = 0
        if p > (n/2) {
            cur = n
            if cur % 2 == 1 {
                cur -= 1
            }
            pace = -2
            // from back
            while cur > p {
                cur += pace
                turn += 1
            }
        } else {
            cur = 1
            pace = 2
            // from front
            while cur < p {
                cur += pace
                turn += 1
            }
        }
        return turn
    }
}
