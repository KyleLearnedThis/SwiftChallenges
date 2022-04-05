//
//  RandomNumber.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 8/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class RandomNumber {
    static func randomInt(range: Range<Int>) -> Int {
        return Int.random(in: range)
    }
}
