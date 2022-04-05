//
//  ExtractNumberSum.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  https://unicode-table.com/en/

import Foundation

class ExtractNumberSum {
    public static func extractNumbers(_ input: String) -> Int {
        var modifiedInput = ""
        for ch in input.unicodeScalars {
            let v = Character(ch).asciiValue!
            print("[\(v)]", terminator: " ")
            if v < 48 || v > 57 {
                modifiedInput.append(":")
            } else {
                modifiedInput.append(Character(ch))
            }
        }
        print("modifiedInput: \(modifiedInput)")
        let numberStrings = modifiedInput.split(separator: ":")
        var result = 0
        for numberString in numberStrings {
            let value = Int(numberString)!
            result = result + value
        }
        return result
    }
}
