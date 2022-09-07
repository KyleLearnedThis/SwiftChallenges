//
//  ValidVariableName.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/7/22.
//

import Foundation

class ValidVariableName {
    func isValidVariable(name: String) -> Bool {
        let input = Array(name)
        if input.isEmpty {
            return false
        }

        if input.count >= 1 && input[0].isNumber {
            return false
        }

        let result = input.map { ch -> Bool in
            if ch.isLowercase || ch.isUppercase {
                return true
            } else if ch.isNumber {
                return true
            } else if ch == "_" {
                return true
            } else {
                return false
            }
        }
        return result.allSatisfy{$0 == true}
    }

}
