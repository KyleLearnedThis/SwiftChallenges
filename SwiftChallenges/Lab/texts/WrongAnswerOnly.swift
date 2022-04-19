//
//  WrongAnswerOnly.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/19/22.
//

import Foundation

class WrongAnswerOnly {
    static func getWrongAnswers(_ C: String) -> String {
        let input = Array(C)
        var result = ""
        input.forEach{ ch in
            if ch == "A" {
                result += "B"
            } else {
                result += "A"
            }
        }
        return result
    }
}
