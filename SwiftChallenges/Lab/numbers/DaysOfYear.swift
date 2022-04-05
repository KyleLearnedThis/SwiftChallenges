//
//  DaysOfYear.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 1/31/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//

import Foundation

class DaysOfYear {
    static let months = [1:31,2:28,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31]
    static func dayOfYear(_ input: String) -> Int {
        let ymd = input.split(separator: "-")
        if ymd.count != 3 {
            return 0
        }
        let year = Int(ymd[0])!
        let month = Int(ymd[1])!
        let date = Int(ymd[2])!

        if month == 1 {
            return date
        } else {
            let sum = months.filter{$0.key < month}
                .map{$0.value}
                .reduce(0,+)
            var all = 0
            if(year % 4 == 0 && month >= 3) {
                if (year % 100 == 0) {
                    if(year % 400 == 0) {
                        all = sum + date + 1
                    } else {
                        all = sum + date
                    }
                } else {
                    all = sum + date + 1
                }
            } else {
                all = sum + date
            }
            return all
        }
    }
}
