//
//  IPChecker.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/22/22.
//

import Foundation


class IPChecker {
    static func isValidIPV4(inputString: String) -> Bool {
        // Temp solution for edge cases.
        if inputString.contains("..") || inputString.contains("..."){
            return false
        }
        let input = inputString.split(separator: ".")
            .compactMap{ i -> Int? in
                if i.count >= 2 && i.starts(with: "0") {
                    return nil
                } else {
                    return Int(i)
                }
            }
        if input.count != 4 {
            return false
        }
        let count = input.filter{ (0...255).contains($0)}.count
        return count == 4
    }
}
