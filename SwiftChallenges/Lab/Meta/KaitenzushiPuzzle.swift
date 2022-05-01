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

    // NSMutableOrderedSet implmentation, assume if we hit content in cache, it moved itself to the back in cache. Time Limit Exceeded on 3 test cases
    static func getMaximumEatenDishCountV2(_ N: Int, _ D: [Int], _ K: Int) -> Int {
        let cache = NSMutableOrderedSet()
        var result = 0
        for i in D.indices {
            let cur = D[i]
            // Not in cache
            if !cache.contains(cur) {
                // cache is not full
                if cache.count < K {
                    cache.add(cur)
                } else {
                // cache is full: remove the oldest entry in cache, then add the latest.
                    cache.removeObject(at: 0)
                    cache.add(cur)
                }
                result += 1
            } else {
                // Is in cache, so make it the latest entry.
                cache.remove(cur)
                cache.add(cur)
            }
        }
        return result
    }

    // Assume we don't need to update cache if we hit an entry, Time Limit Exceeded on 2 test cases
    static func getMaximumEatenDishCountV3(_ N: Int, _ D: [Int], _ K: Int) -> Int {
        let cache = NSMutableOrderedSet()
        var result = 0
        for i in D.indices {
            let cur = D[i]
            // Not in cache
            if cache.contains(cur) {
                continue
            }
            cache.add(cur)
            result += 1

            if cache.count > K {
                cache.removeObject(at: 0)
            }
        }
        return result
    }
}
