//
//  TruncateSentence.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 7/18/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/truncate-sentence/

import Foundation

class TruncateSentence {
    static func truncateSentence(_ s: String, _ k: Int) -> String {
        let arr = s.split(separator: " ")
        let slice = Array(arr[0..<k])
        var result = ""
        for i in slice.indices {
            let word = slice[i]
            if i == 0 {
                result += word
            } else {
                result += " \(word)"
            }
        }
        return result
    }
}
