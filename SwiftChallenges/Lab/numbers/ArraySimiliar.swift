//
//  ArraySimiliar.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/4/22.
//  CodeSignal "Are Similar?
//  Two arrays are called similar if one can be obtained from another by swapping at most one pair of elements in one of the arrays.



import Foundation

class ArraySimiliar {
    static func isSimiliar(a: [Int], b: [Int]) -> Bool {
        var count = 0
        let x = a.map{$0}.sorted()
        let y = b.map{$0}.sorted()
        if x != y {
            return false
        }

        for i in a.indices {
            let a1 = a[i]
            let b1 = b[i]

            if a1 != b1 {
                count += 1
            }
        }
        return count == 2 || count == 0
    }
}
