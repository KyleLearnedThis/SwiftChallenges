//
//  NumberOfJewelsInStones.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/jewels-and-stones/

import Foundation

class NumberOfJewelsInStones {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let map = makeFrequencyMap(input: S)
        var count = 0
        for i in J.indices {
            let key = String(J[i])
            if let current = map[key] {
                count = count + current
            }
        }
        return count
    }

    func makeFrequencyMap(input: String) -> [String: Int] {
        var map: Dictionary<String, Int> = [:]
        for i in input.indices {
            let key = String(input[i])
            if map[key] == nil {
                map[key] = 1
            } else {
                let value = map[key]! + 1
                map[key] = value
            }
        }
        return map
    }
}
