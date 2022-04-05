//
//  RankTransformArray.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 1/31/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/rank-transform-of-an-array/

import Foundation

class RankTransformArray {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var result = [Int]()
        let sortedArr = Array(Set(arr)).sorted()
        var rankMap = [Int: Int]() // key: arr item, value: rank

        for i in sortedArr.indices {
            let key = sortedArr[i]
            if rankMap[key] == nil {
                rankMap[key] = i + 1
            }
        }

        for i in arr.indices {
            let key = arr[i]
            let rank = rankMap[key]!
            result.append(rank)
        }

        return result
    }
}
