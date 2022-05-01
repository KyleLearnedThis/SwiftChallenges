//
//  BattleshipProbability.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/19/22.
//

import Foundation

class BattleshipProbability {
    func getHitProbability(_ R: Int, _ C: Int, _ G: [[Int]]) -> Float {
        var sum = 0
        for i in G {
            let cur = i.filter{$0 == 1}.count
            sum += cur
        }
        let prob: Float = Float(sum) / Float(R * C)
        return prob
    }
}
