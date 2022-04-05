//
//  DestinationCity.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/16/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/destination-city/

import Foundation

class DestinationCity {
    static func destCity(_ paths: [[String]]) -> String {
        var map = [String:String]()
        for route in paths {
            if route.count >= 2 {
                let src = route.first!
                let dest = route.last!
                map[src] = dest
            }
        }

        let srcs = Set(map.keys)
        let dests = Set(map.values)
        let results = Array(dests.subtracting(srcs))

        return results[0]
    }
}
