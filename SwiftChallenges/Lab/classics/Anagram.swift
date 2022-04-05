//
//  Anagram.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 7/30/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class Anagram {
    static func isAnagram(first: String, second: String) -> Bool {
        return makeFrequencyDictionary(first) == makeFrequencyDictionary(second)
    }

    static func makeFrequencyDictionary(_ input: String) -> [Character: Int]{
        var result = [Character: Int]()
        Array(input).forEach{ i in
            result[i] = result[i, default: 0] + 1
        }
        return result
    }
}
