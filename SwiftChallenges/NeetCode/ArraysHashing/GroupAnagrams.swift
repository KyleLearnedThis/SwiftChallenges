//
//  GroupAnagrams.swift
//  InterviewPrep
//
//  Created by KyleLearnedThis on 4/18/26.
//  https://leetcode.com/problems/group-anagrams/

import Foundation

class GroupAnagrams {
    /// note that dictionary is unordered in swift, array conversion order might be different than expected
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for str in strs {
            let key = String(str.sorted())
            dict[key, default: []].append(str)
        }
        return Array(dict.values)
    }

    func groupAnagramsV2(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]

        for str in strs {
            let key = String(str.sorted())
            dict[key, default: []].append(str)
        }

        return dict.keys.sorted().map { dict[$0]! }
    }
}
