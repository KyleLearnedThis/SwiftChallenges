//
//  ChessBoardCellColor.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/7/22.
//

import Foundation

class ChessBoardCellColor {
    static func sameColor(cell1: String, cell2: String) -> Bool {
        let c1 = isBlack(input: cell1)
        let c2 = isBlack(input: cell2)

        return c1 == c2
    }

    static func isBlack(input: String) -> Bool {
        let index = ["A":0, "B":1, "C":2, "D":3, "E":4, "F":5, "G":6, "H":7,
                     "1":0, "2":1, "3":2, "4":3, "5":4, "6":5, "7":6, "8":7]
        let temp = Array(input).map {
            String($0)
        }

        let x = index[temp[0]]!
        let y = index[temp[1]]!

        var result = true

        for i in 0...x {
            if i == 0 {
                continue
            }
            result.toggle()
        }
        for j in 0...y {
            if j == 0 {
                continue
            }
            result.toggle()
        }
        return result
    }
}
