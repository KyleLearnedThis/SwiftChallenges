//
//  NumberOfWays.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/14/22.
//  https://www.geeksforgeeks.org/count-pairs-with-given-sum/

import Foundation

class NumberOfWays {
    static func numberOfWays(arr: [Int], k: Int) -> Int {
        var output = 0
        for i in arr.indices {
            for n in i+1 ..< arr.count {
                if arr[i] + arr[n] == k {
                    output += 1
                }
            }
        }
        return output
    }
}
