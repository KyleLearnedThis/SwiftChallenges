//
//  KaitenzushiPuzzle.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/20/22.
//  https://leetcode.com/discuss/interview-question/1682612/facebook-online-puzzle-kaitenzushi-puzzle-question

import Foundation

class KaitenzushiPuzzle {
    // V1 because it doesn't pass all the test cases, since this can't deal with large data set
    static func getMaximumEatenDishCountV1(_ N: Int, _ D: [Int], _ K: Int) -> Int {
        var cache = [Int]()
        var result = 0
        for i in D.indices {
            let cur = D[i]
            if !cache.contains(cur) {
                result += 1
            } else {
                continue
            }
            if cache.count >= K {
                cache.remove(at: 0)
            }
            cache.append(cur)
        }
        return result
    }
}
