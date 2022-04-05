//
//  MappingTransform.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class MappingTransform {
    static func toIntArrayExample(_ input: [String]) -> [Int] {
        let result = input.compactMap{ Int($0) }
        return result
    }

    static func mergeTwoArrayToDictionary(_ names: [String], _ ids: [Int]) -> [String: Int]{
        let result = Dictionary(uniqueKeysWithValues: zip(names, ids))
        return result
    }

    static func convertPeopleToDictionary(_ people: [Person]) -> [String: Int] {
        let result = Dictionary(uniqueKeysWithValues: people.map { ($0.mName, $0.mId) })
        return result
    }
}
