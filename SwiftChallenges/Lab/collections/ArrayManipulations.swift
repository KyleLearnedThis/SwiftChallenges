//
//  ArrayConcatenation.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 7/18/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class ArrayManipulations {

    // https://leetcode.com/problems/concatenation-of-array/
    static func getConcatenation(_ nums: [Int]) -> [Int] {
        let result = nums + nums
        return result
    }

    // https://leetcode.com/problems/shuffle-the-array/
    // Note that array size is always even as precondition
    static func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var result = [Int]()
        let n = nums.count/2
        let l = Array(nums[0..<n])
        let r = Array(nums[n..<nums.count])
        for i in 0..<n {
            let v1 = l[i]
            let v2 = r[i]
            result.append(v1)
            result.append(v2)
        }
        return result
    }
}
