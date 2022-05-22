//
//  DaysOfRussianProgrammer.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/22/22.
//  https://www.hackerrank.com/challenges/day-of-the-programmer/problem?isFullScreen=true

import Foundation

class DaysOfRussianProgrammer {
    static func dayOfProgrammer(year: Int) -> String {
        let months = [1:31,2:28,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31]
        var cur = 256

        // https://medium.com/codebrace/day-of-the-programmer-5ae459953241
        if year == 1918 {
            cur += 13
        }

        var isLeap = false

        if year % 4 == 0 {
            // Russia changed from Julian to Georgian Calendar at 1919
            if year <= 1919 {
                isLeap = true
            } else {
                if year % 400 == 0 {
                    isLeap = true
                } else {
                    if year % 100 == 0 {
                        isLeap = false
                    } else {
                        isLeap = true
                    }
                }
            }
        }

        var dd = ""
        var mm = ""
        for i in 1 ... 12 {
            var day = months[i, default:  0]
            if i == 2 && isLeap {
                day = 29
            }

            if day > cur {
                dd = String(cur)
                if cur < 10 {
                    dd = "0" + dd
                }
                mm = String(i)
                if i < 10 {
                    mm = "0" + mm
                }
                break
            } else {
                cur -= day
            }
        }

        return "\(dd).\(mm).\(year)"
    }
}
