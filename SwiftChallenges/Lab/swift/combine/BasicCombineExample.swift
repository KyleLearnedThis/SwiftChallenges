//
//  BasicCombineExample.swift
//  SwiftCodes
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import Foundation
import Combine

@available(OSX 10.15, *)
class BasicCombineExample {
    static func sqaure(input: Int) {
        let _ = Just(input).map { v1 -> Int in
            let sqr = v1 * v1
            return sqr
        }.sink { v2 in
            print("===== input: \(input) output: \(v2) =====")
        }
    }
}
