//
//  RelativeSortArray.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/16/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/relative-sort-array/

import Foundation

class RelativeSortArray {
    static func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var result = [Int]()
        // Key: number, Value: occurrence
        var frequency = [Int:Int]()
        for n1 in arr1 {
            if let value = frequency[n1] {
                frequency[n1] = value + 1
            } else {
                frequency[n1] = 1
            }
        }

        var arr3 = Array(arr1)
        for i in arr2.indices {
            let key = arr2[i]
            let freq = frequency[key]!
            arr3.removeAll(where: {$0 == key})
            for _ in 0 ..< freq {
                result.append(key)
            }
        }
        arr3 = arr3.sorted()
        result.append(contentsOf: arr3)
        return result
    }
}
