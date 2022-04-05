//
//  RansomNotes.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 4/29/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://www.hackerrank.com/challenges/ctci-ransom-note/

import Foundation

class RansomNotes {
    static func checkMagazinePrint(magazine: [String], note: [String]) -> Void {
        let result = checkMagazineWork(magazine: magazine, note: note)
        if result {
            print("Yes")
        } else {
            print("No")
        }
    }

    static func checkMagazineWork(magazine: [String], note: [String]) -> Bool {
        var freq = makeFrequency(magazine)
        for word in note {
            if freq.keys.contains(word) {
                let value = freq[word]!
                if value == 0 {
                    return false
                } else {
                    freq[word] = value - 1
                }
            } else {
                return false
            }
        }
        return true
    }

    static func makeFrequency(_ magazine: [String]) ->  [String: Int] {
        var freq: [String: Int] = [:]
        magazine.forEach { word in
            freq[word] = freq[word, default: 0] + 1
        }
        return freq
    }
}
