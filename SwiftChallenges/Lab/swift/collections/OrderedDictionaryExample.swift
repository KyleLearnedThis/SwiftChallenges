//
//  OrderedDictionaryExample
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class OrderedDictionaryExample {
    static func orderByDictionaryValue(_ input: [Int], _ isDescending: Bool) -> [(Int, Int)] {
        let map = makeMap(input)
        var sortedMap = [(Int, Int)]()

        if isDescending {
            sortedMap = map.sorted { $0.1 > $1.1 }
        } else {
            sortedMap = map.sorted { $0.1 < $1.1 }
        }

        printTuple(n: sortedMap)
        return sortedMap
    }

    static func makeMap(_ input: [Int]) -> Dictionary<Int, Int> {
        var map = Dictionary<Int, Int>()
        for i in input {
            if let value = map[i] {
                map[i] = value + 1
            } else {
                map[i] = 1
            }
        }
        return map
    }

    static func printTuple(n: [(Int, Int)]) {
        for (key, value) in n {
            print("[key: \(key)] [value: \(value)]")
        }
    }

    static func orderByDictionaryKey(_ input: [Int], _ isDescending: Bool) -> [(Int, Int)] {
        let map = makeMap(input)
        var sortedMap = [(Int, Int)]()

        if isDescending {
            sortedMap = map.sorted { $0.0 < $1.0 }
        } else {
            sortedMap = map.sorted { $0.0 > $1.0 }
        }

        printTuple(n: sortedMap)
        return sortedMap
    }
}
