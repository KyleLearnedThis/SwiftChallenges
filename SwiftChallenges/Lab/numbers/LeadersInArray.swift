//
//  LeadersInArray.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 11/29/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://practice.geeksforgeeks.org/problems/leaders-in-an-array-1587115620/1

import Foundation

class LeadersInArray {
    static func leaders(arr: [Int]) -> [Int] {
        var list = [Int]()
        for i in 0..<arr.count  {
            let cur = arr[i]
            if i != arr.count - 1 {
                let slice = arr[i+1 ... arr.count - 1]
                let sum = Array(slice).reduce(0, +)
                if cur >= sum {
                    list.append(cur)
                }
            } else {
                list.append(cur)
            }
        }
        return list
    }
}
