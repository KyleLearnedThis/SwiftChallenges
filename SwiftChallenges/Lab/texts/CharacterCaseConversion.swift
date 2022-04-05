//
//  CharacterCaseConversion.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/15/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/to-lower-case/

import Foundation

class CharacterCaseConversion {
    static func toLowerCase(_ str: String) -> String {
        var result = ""
        let array = Array(str)
        for ch in array {
            if ch.isUppercase {
                result += ch.lowercased()
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
