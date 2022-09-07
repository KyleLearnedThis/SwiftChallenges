//
//  EvenDigitsOnly.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/7/22.
//

import Foundation

class EvenDigitsOnly {
    static func allEven(n: Int) -> Bool {
        let input = Array(String(n))
        let result = input.map { i -> Bool in
            let x = String(i)
            let res = (Int(x)!) % 2 == 0
            return res
        }

        return result.allSatisfy{$0 == true}
    }
}
