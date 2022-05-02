//
//  EncryptedWords.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/1/22.
//  https://www.johncanessa.com/2020/12/05/encrypted-words/

import Foundation

class EncryptedWords {
    static func findEncryptedWord(s: String) -> String {
        if s.count <= 1 {
            return s
        }
        let input = Array(s)
        var result = ""
        var mid: Int = 0

        mid = input.count / 2
        if input.count % 2 == 0 {
            mid -= 1
        }

        // middle character
        let center = String(input[mid])
        result += center

        if mid > 0 {
            let leftSide = String(input[0..<mid])
            result += findEncryptedWord(s: leftSide)
        }

        if mid < input.count - 1 {
            let rightSide = String(input[mid+1..<input.count])
            result += findEncryptedWord(s: rightSide)
        }

        return result
    }
}
