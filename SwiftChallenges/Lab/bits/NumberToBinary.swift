//
//  NumberToBinary.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class NumberToBinary {
    func toBinary(input: Int) -> String {
        var result = ""
        var x = input
        repeat {
            if x % 2 == 0 {
                result.insert("0", at: result.startIndex)
            } else {
                result.insert("1", at: result.startIndex)
            }
            x = x >> 1
        } while x != 0
        return result
    }
}
