//
//  RepeatTwoNArray.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class RepeatTwoNArray {
    func repeatedNTimes(_ A: [Int]) -> Int {
        let n = A.count / 2
        let map = makeFrequencyMap(A)
        for (key, value) in map {
            if value == n {
                return key
            }
        }
        return 0
    }

    func makeFrequencyMap(_ input: [Int]) -> [Int: Int] {
        var map: Dictionary<Int, Int> = [:]
        for i in input.indices {
            let key = input[i]
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
