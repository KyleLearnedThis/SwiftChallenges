//
//  NumberOfLineJumps.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/13/22.
//  https://www.hackerrank.com/challenges/kangaroo/problem?isFullScreen=true

import Foundation

class NumberOfLineJumps {
    func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
        if x1 > x2 && v1 > v2 {
            return "NO"
        } else if x1 < x2 && v1 < v2 {
            return "NO"
        }

        if v1 == v2 {
            return "NO"
        } else if abs(x2 - x1) % abs(v2 - v1) == 0 {
            return "YES"
        }

        return "NO"
    }
}
