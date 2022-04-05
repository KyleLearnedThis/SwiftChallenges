//
//  LongestCommonPrefix.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  http://www.programcreek.com/2014/02/leetcode-longest-common-prefix-java/
//  https://leetcode.com/problems/longest-common-prefix/
//

import Foundation

class LongestCommonPrefix {

    static func longestCommonPrefix(_ input: [String]) -> String {
        if input.isEmpty {
            return ""
        } else if input.count == 1 {
            return input[0]
        }

        var min = Int.max

        for i in input.indices {
            let str = input[i]
            let n = str.count
            if n < min {
                min = n
            }
        }

        for i in 0..<min {
            for j in 0 ..< input.count - 1  {
                let s1 = Array(input[j])
                let s2 = Array(input[j+1])
                if s1[i] != s2[i] {
                    let r1 = s1.index(s1.startIndex, offsetBy: i)
                    let sub = String(s1[s1.startIndex..<r1])
                    return sub
                }
            }
        }
        let result = input[0]
        let r2 = result.index(result.startIndex, offsetBy: min)
        return String(result[result.startIndex..<r2])
    }
}
