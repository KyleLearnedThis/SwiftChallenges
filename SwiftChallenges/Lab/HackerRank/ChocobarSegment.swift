//
//  ChocobarSegment.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/10/22.
//  https://www.hackerrank.com/challenges/the-birthday-bar/problem?isFullScreen=true&h_r=next-challenge&h_v=zen

import Foundation

class ChocobarSegment {
    static func birthday(s: [Int], d: Int, m: Int) -> Int {
        // m is length of bar
        // d is sum of the segment
        var result: Int = 0
        let count = s.count - m
        for i in 0 ... count {
            let segment = Array(s[i..<i+m])
            let sum = segment.reduce(0,+)
            if sum == d {
                result += 1
            }
        }
        return result
    }
}
