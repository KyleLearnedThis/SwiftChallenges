//
//  RobotOrigin.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/13/22.
//  https://leetcode.com/problems/robot-return-to-origin/

import Foundation

class RobotOrigin {
    static func judgeCircle(_ moves: String) -> Bool {
        var x = 0
        var y = 0
        moves.forEach { ch in
            switch(ch) {
            case "U":
                y += 1
            case "D":
                y -= 1
            case "L":
                x -= 1
            case "R":
                x += 1
            default:
                break
            }
        }
        return x == 0 && y == 0
    }
}
