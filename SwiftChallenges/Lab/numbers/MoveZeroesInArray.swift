//
//  MoveZeroesInArray.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/18/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class MoveZeroesInArray {
    static func moveZeroesToFront(_ input: [Int]) -> [Int] {
        var result = [Int]()
        for number in input {
            if number == 0 {
                result.insert(number, at: 0)
            } else {
                result.append(number)
            }
        }
        return result
    }

    static func swap(_ array: inout [Int], _ l: Int, _ r: Int) {
        let temp = array[l]
        array[l] = array[r]
        array[r] = temp
    }
}
