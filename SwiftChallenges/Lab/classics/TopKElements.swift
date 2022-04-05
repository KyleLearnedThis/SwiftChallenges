//
//  TopKElements.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class TopKElements {
    func topKFrequent(_ input: [Int], k: Int) -> Int {
        var map = Dictionary<Int, Int>()
        input.forEach{ i in
            let value = map[i, default: 0] + 1
            map[i] = value
        }
        let entries: Array<(key: Int, value: Int)> = map.sorted { $0.1 > $1.1 }
        return entries[k - 1].value
    }
}
