//
//  BaseOrderedMap.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/22.
//  A really simple ordered Dictionary

import Foundation

class BaseOrderedMap<S: Hashable, T: Comparable> {
    var list: [S]
    var map: [S:T]
    init() {
        self.list = [S]()
        self.map = [S:T]()
    }

    func insert(_ key: S,_ value: T) {
        list.append(key)
        map[key] = value
    }

    func remove(key: S) {
        list = list.filter{$0 != key}
        map.removeValue(forKey: key)
    }

    var keys: [S] {
        return list
    }

    var values: [T] {
        var result = [T]()
        for key in list {
            let value = map[key]!
            result.append(value)
        }
        return result
    }

    subscript(_ key: S) -> T? {
        let value = map[key]
        return value
    }
}
