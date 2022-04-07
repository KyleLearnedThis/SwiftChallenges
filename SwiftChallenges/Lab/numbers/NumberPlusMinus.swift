//
//  NumberPlusMinus.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/7/22.
//  https://www.hackerrank.com/challenges/plus-minus/problem

import Foundation

class NumberPlusMinus {
    static func plusMinus(arr: [Int]) -> [Float] {
        let n = arr.count
        let pos = arr.filter {$0 > 0}.count
        let neg = arr.filter {$0 < 0}.count
        let zer = arr.filter{$0 == 0}.count
        let N = Float(n)
        return [Float(pos)/N, Float(neg)/N, Float(zer)/N]
    }
}
