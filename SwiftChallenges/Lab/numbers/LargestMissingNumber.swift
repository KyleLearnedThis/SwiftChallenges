//
//  LargestMissingNumber.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 9/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  Given an array A of N integers, returns the smallest positive integer (greater than 0)
//  that does not occur in A.

import Foundation


class LargestMissingNumber {
    static public func largest(_ a : [Int]) -> Int {
        let set = Set(a).filter{$0 > 0}
        var input = Array(set)
        input.sort()
        for (index, number) in input.enumerated() {
            if number > index + 1 {
                return index + 1
            }
        }
        let largest = (input.last ?? 0) + 1
        return largest
    }
}
