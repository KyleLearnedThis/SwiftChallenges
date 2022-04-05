//
//  DuplicateZeros.swift
//  SwiftCodes
//

//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class DuplicateZeros {
    func duplicateZeros(_ arr: inout [Int]) {
        var result = Array<Int>()
        for i in arr.indices {
            let value = arr[i]
            result.append(value)
            if value == 0 {
                result.append(0)
            }
        }
        let copy = Array(result[0..<arr.count])
        arr = copy
    }
}
