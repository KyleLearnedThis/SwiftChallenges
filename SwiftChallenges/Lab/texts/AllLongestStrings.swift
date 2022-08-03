//
//  AllLongestStrings.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/3/22.
//  CodeSignal: "All Longest Strings"
//  Given an array of strings, return another array containing all of its longest strings.


import Foundation

class AllLongestStrings {
    func longest(inputArray: [String]) -> [String] {
        let array = inputArray.map{ $0.count }
        let arraySet = Set(array)
        let max = arraySet.max()!
        let result = inputArray.filter{ $0.count == max }
        return result
    }
}
