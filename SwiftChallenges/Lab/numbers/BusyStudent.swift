//
//  BusyStudent.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 7/7/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/number-of-students-doing-homework-at-a-given-time/

import Foundation

class BusyStudent {
    static func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        let list = zip(startTime, endTime)
        var count = 0
        for tuple in list {
            let start = tuple.0
            let end = tuple.1
            if (start ... end).contains(queryTime) {
                count += 1
            }
        }
        return count
    }
}
