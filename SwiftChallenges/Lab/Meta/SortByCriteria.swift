//
//  SortByCriteria.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/9/22.
//

import Foundation

class TripletThing {
    var a: Int
    var b: Int
    var c: Int
    init(_ a: Int = 0, _ b: Int = 0, _ c: Int = 0) {
        self.a = a
        self.b = b
        self.c = c
    }
}

class SortByCriteria {
    func sortBy(input: [TripletThing]) -> [TripletThing] {
        var result = input.map {$0}
        result = result.sorted { (lhs, rhs) -> Bool in
            return (lhs.a, rhs.b, rhs.c) < (rhs.a, lhs.b, lhs.c)
        }
        return result
    }
}
