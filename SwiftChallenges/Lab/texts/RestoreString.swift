//
//  RestoreString.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 3/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/shuffle-string/

import Foundation

class RestoreString {
    static func restoreString(_ s: String, _ indices: [Int]) -> String {
        let input = Array(s)
        var dict = [Int: Character]()
        for i in input.indices {
            let key = indices[i]
            let value = input[i]
            dict[key] = value
        }

        var output = [Character](repeating: "0", count: input.count)
        for (key, value) in dict {
            output[key] = value
        }
        return String(output)
    }
}
