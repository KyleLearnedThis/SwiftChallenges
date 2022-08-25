//
//  BattleShip.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/24/22.
//  https://leetcode.com/problems/battleships-in-a-board/

import Foundation

class BattleShip {
    static func countBattleships(_ board: [[String]]) -> Int {
        var num = 0
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "." {
                    continue
                }
                if i > 0 && board[i-1][j] == "X" {
                    continue
                }
                if j > 0 && board[i][j-1] == "X" {
                    continue
                }
                if board[i][j] == "X" {
                    num += 1
                }
            }
        }
        return num
    }
}
