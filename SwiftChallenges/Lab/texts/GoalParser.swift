//
//  GoalParser.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/6/22.
//  https://leetcode.com/problems/goal-parser-interpretation/

import Foundation

class GoalParser {
    static func interpret(_ command: String) -> String {
        var result = command.replacingOccurrences(of: "()", with: "o")
        result = result.replacingOccurrences(of: "(al)", with: "al")
        return result
    }
}
