//
//  StringArraysEquivalent.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/check-if-two-string-arrays-are-equivalent/

import Foundation

class StringArraysEquivalent {
    static func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        let l = String(Array(word1.reduce("", +)))
        let r = String(Array(word2.reduce("", +)))
        return l == r
    }
}
