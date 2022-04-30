//
//  NSOrderedSetExample.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/30/22.
//

import Foundation

class NSOrderedSetExample {
    static func basic() -> NSMutableOrderedSet {
        let set = NSMutableOrderedSet()
        set.add("Apple");
        set.addObjects(from: ["Apple", "Orange", "Banana"])
        set.add("Banana");
        return set
    }

    static func intersect(_ a: [Int], _ b: [Int]) -> NSMutableOrderedSet {
        let A = NSMutableOrderedSet()
        let B = NSMutableOrderedSet()
        A.addObjects(from: a)
        B.addObjects(from: b)
        A.intersect(B)
        return A
    }

    static func remove() -> NSMutableOrderedSet {
        let set = NSMutableOrderedSet()
        set.addObjects(from: [1,3,5,7,9])
        set.removeObject(at: 0)
        return set
    }

}
