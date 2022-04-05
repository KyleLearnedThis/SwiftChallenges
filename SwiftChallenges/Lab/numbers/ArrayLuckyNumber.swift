//
//  ArrayLuckyNumber.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 3/24/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/find-lucky-integer-in-an-array/

import Foundation

class ArrayLuckyNumber {
    static func findLucky(_ arr: [Int]) -> Int {
        let dict = makeFrequencyDictionary(arr)
        let list = dict.sorted { $0.0 > $1.0 }
        for item in list {
            if item.key == item.value {
                return item.key
            }
        }
        return -1
    }

    static func makeFrequencyDictionary(_ arr: [Int]) -> [Int:Int] {
        var dict = Dictionary<Int,Int>()
        arr.forEach{ num in
            dict[num] = dict[num, default: 0] + 1
        }
        return dict
    }
}
