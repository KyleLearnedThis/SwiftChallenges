//
//  SortByMember.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class SortByMember {

    static func sortPair(_ n: [BasicPair]) -> [BasicPair]{
        let x = n.sorted(by: { $0.key < $1.key })
        x.forEach({
            print("key: \($0.key) value: \($0.value)")
        })
        return x
    }

    static func sortTuple(_ n: [(Int, String)]) -> [(Int, String)]{
        let x = n.sorted(by: { $0.0 < $1.0 })
        x.forEach({
            print("key: \($0.0) value: \($0.0)")
        })
        return x
    }
}
