//
//  CommonCharacterCount.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/3/22.
//  CodeSignal: Given two strings, find the number of common characters between them.

import Foundation

class CommonCharacterCount {
    func commonCharacters(s1: String, s2: String) -> Int {
        var sum = 0
        let d1 = makeDictionary(input: s1)
        let d2 = makeDictionary(input: s2)
        for (key, value) in d1 {
            if let num = d2[key] {
                let cur = min(value, num)
                sum += cur
            }
        }
        return sum
    }

    private func makeDictionary(input: String) -> [Character:Int] {
        var map = [Character:Int]()
        let array = Array(input)
        for ch in array {
            let key = ch
            let value = map[key, default: 0] + 1
            map[key] = value
        }
        return map
    }
}
