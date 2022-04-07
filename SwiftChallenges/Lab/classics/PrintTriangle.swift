//
//  PrintTriangle.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/7/22.
//  https://www.hackerrank.com/challenges/staircase/problem

import Foundation

class PrintTriangle {
    static func staircaseV01(n: Int) -> Void {
        for i in 0 ..< n {
            for j in 0 ..< n {
                let m = n - j - 1
                if i < m {
                    print(" ", terminator: "")
                } else {
                    print("#", terminator: "")
                }
            }
            print("")
        }
    }
}
