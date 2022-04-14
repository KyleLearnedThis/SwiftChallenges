//
//  RotationalCipher.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/12/22.
//  HackerRank

import Foundation

class RotationalCipher {

    let backing: String

    init(backing: String) {
        self.backing = backing
    }

    func cipher(withRotationFactor: Int) -> String {
        var result = [Character]()
        let input = Array(backing)

        for ch in input {
            if ch.isLetter || ch.isNumber {
                let rs = rotateCharacter(ch: ch, withRotationFactor: withRotationFactor)
                result.append(rs)
            } else {
                result.append(ch)
            }
        }

        let finalResult = String(result)
        return finalResult

    }

    func rotateCharacter(ch: Character, withRotationFactor: Int) -> Character {
        var rs = Character("\n")
        var x : Int = 0
        if ch.isUppercase {
            x = 65 + (((Int(ch.asciiValue!) + withRotationFactor) - 65 ) % 26)
        } else if ch.isLowercase {
            x = 97 + (((Int(ch.asciiValue!) + withRotationFactor) - 97 ) % 26)
        } else if ch.isNumber {
            x = 48 + (((Int(ch.asciiValue!) + withRotationFactor) - 48 ) % 10)
        }
        if let myUnicodeScalar = UnicodeScalar(x) {
            rs = Character(myUnicodeScalar)
        }
        return rs
    }
}
