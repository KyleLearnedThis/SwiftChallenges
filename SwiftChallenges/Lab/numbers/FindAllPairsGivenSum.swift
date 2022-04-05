//
//  FindAllPairsGivenSum.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 1/20/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//  https://practice.geeksforgeeks.org/problems/find-all-pairs-whose-sum-is-x5808/1

import Foundation

class FindAllPairsGivenSum {
    // Basic solution -> O(n) = n^2
    static func allPairs(_ a: [Int], _ b: [Int], _ n: Int) -> [(l: Int, r: Int)] {
        var result = [(l: Int, r: Int)]()
        for l in a {
            for r in b {
                if(n == l + r) {
                    let tuple = (l,r)
                    result.append(tuple)
                }
            }
        }
        return result
    }

    // Hasing Solution -> O(max(n, m))
    static func allPairsV2(_ a: [Int], _ b: [Int], _ n: Int) -> [(l: Int, r: Int)] {
        var result = [(l: Int, r: Int)]()
        var dict = [Int:Int]()
        for i in a {
            dict[i] = 0
        }
        for j in b {
            let rem = n - j
            if dict.keys.contains(rem) {
                let tuple = (rem, j)
                result.append(tuple)
            }
        }
        result = result.sorted(by: {$0.r > $1.r})
        return result
    }
}
