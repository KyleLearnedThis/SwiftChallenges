//
//  DecodeMessage.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/15/22.
//  https://leetcode.com/problems/decode-the-message/

import Foundation

class DecodeMessage {
    static func decode(_ key: String, _ message: String) -> String {
        let values = Array("abcdefghijklmnopqrstuvwxyz")
        let keys = Array(key.replacingOccurrences(of: " ", with: ""))
        var newKeys = [Character]()
        keys.forEach {
            if newKeys.contains($0) != true {
                newKeys.append($0)
            }
        }
        let decoder: [Character:Character] = Dictionary(uniqueKeysWithValues: zip(newKeys, values))
        var result = ""
        let input = Array(message)
        for ch in input {
            if ch != " " {
                let value = decoder[ch]!
                result += String(value)
            } else {
                result += " "
            }
        }
        return result
    }
}
