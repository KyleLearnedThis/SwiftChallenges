//
//  SortingSentence.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/6/22.
//  https://leetcode.com/problems/sorting-the-sentence/

import Foundation

class SortingSentence {
    static func sortSentence(_ s: String) -> String {
        var dict = [Int:String]()
        var result = ""
        let cuts = s.split(separator: " ")
        for cut in cuts {
            let temp = cut.components(separatedBy: NSCharacterSet.decimalDigits.inverted).last!
            let index = Int(temp)!
            let text = String(Array(cut).filter{ $0.isLetter})
            dict[index] = text
        }

        let list = dict.sorted{ $0.key < $1.key }
        for i in list.indices {
            let text = list[i].value
            result.append(contentsOf: text)
            if i != list.count - 1 {
                result.append(contentsOf: " ")
            }
        }

        return result
    }
}
