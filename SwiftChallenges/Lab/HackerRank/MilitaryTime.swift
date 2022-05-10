//
//  MilitaryTime.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/10/22.
//  https://www.hackerrank.com/challenges/time-conversion/problem?isFullScreen=true

import Foundation


class MilitaryTime {
    static func timeConversion(s: String) -> String {
        var result = ""
        let arr = s.split(separator: ":")
        if arr.count != 3 {
            return result
        }

        var hour = String(arr[0])
        let minute = String(arr[1])
        let secondAntePost = String(arr[2])
        let temp = Array(secondAntePost)

        let antePost = String(temp[temp.count - 2 ..< temp.count])
        let seconds = String(temp[0 ..< temp.count - 2])
        var hourInt = Int(hour)!

        if antePost == "PM" {
            if hourInt != 12 {
                hourInt = hourInt + 12
//                hourInt = hourInt % 24
            }
        } else if antePost == "AM" {
            if hourInt == 12 {
                hourInt = hourInt - 12
            }
        }

        if hourInt < 10 {
            hour = "0\(hourInt)"
        } else {
            hour = "\(hourInt)"
        }

        result = "\(hour):\(minute):\(seconds)"
        return result
    }
}
