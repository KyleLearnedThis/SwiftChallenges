//
//  ConvertTypes.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class ConvertTypes {
    static func examples() {
        print("====== Int to String ======")
        let i1 = Int(1234)
        let s1 = String(i1)
        print("s1: \(s1)")

        print("====== String to Int ======")
        let s2 = String("4321")
        if let i2 = Int(s2) {
            print("i2: \(i2)")
        }
    }
}
