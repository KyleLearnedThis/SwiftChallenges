//
//  CircularArrayQuery.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/25/22.
//  https://www.hackerrank.com/challenges/circular-array-rotation/problem?isFullScreen=true

import Foundation

class CircularArrayQuery {
    func circularArrayRotation(a: [Int], k: Int, queries: [Int]) -> [Int] {
        var result = [Int]()
        let n = a.count
        let l = Array(a.prefix(n-k))
        var r = Array(a.suffix(k))
        r.append(contentsOf: l)
        result = queries.map {
            r[$0]
        }
        return result
    }
}
