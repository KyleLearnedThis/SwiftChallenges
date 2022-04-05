//
//  CharacterExpansion.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class CharacterExpansion {

    static func numberExpansion(_ input: String) -> String {
        var result = ""
        var stack = Array<Int>()
        let inputCharArray = Array(input)

        for ch in inputCharArray {
            if ch.isNumber {
                stack.append(Int(String(ch))!)
            } else if ch.isLetter  {
                if stack.isEmpty {
                    result.append(ch)
                } else {
                    result = result + expandByStack(&stack, ch)
                }
            }
        }
        return result
    }

    static func expandByStack(_ stack: inout Array<Int>, _ ch: Character) -> String {
        var power = 1
        var times = 0

        while !stack.isEmpty {
            let value = stack.popLast()!
            times = times + (power * value)
            power = power * 10
        }
        let result =  String(repeating: ch, count: times)
        return result
    }
}
