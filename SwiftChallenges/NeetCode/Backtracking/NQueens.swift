//
//  NQueens.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/19/26.
//  https://leetcode.com/problems/n-queens/

class NQueens {

    func solveNQueens(_ n: Int) -> [[String]] {
        var result: [[String]] = []
        var cols = Set<Int>()    // columns already occupied by a queen
        var negDiag = Set<Int>()   // (row - col) uniquely identifies each top-left→bottom-right diagonal
        var posDiag = Set<Int>()   // (row + col) uniquely identifies each top-right→bottom-left diagonal
        var board = [Int](repeating: 0, count: n)  // board[row] = column where queen is placed

        func backtrack(_ row: Int) {
            // All rows filled — convert column indices to board strings and record the solution
            if row == n {
                result.append(board.map { col in
                    String(repeating: ".", count: col) +
                    "Q" +
                    String(repeating: ".", count: n - col - 1)
                })
                return
            }

            for col in 0..<n {
                // Skip if this column or either diagonal is already under attack
                if cols.contains(col) ||
                    negDiag.contains(row - col) ||
                    posDiag.contains(row + col) {
                    continue
                }

                // Place queen: mark column and both diagonals as occupied
                cols.insert(col)
                negDiag.insert(row - col)
                posDiag.insert(row + col)
                board[row] = col

                backtrack(row + 1)

                // Remove queen: unmark so other branches can reuse this position
                cols.remove(col)
                negDiag.remove(row - col)
                posDiag.remove(row + col)
            }
        }

        backtrack(0)
        return result
    }
}
