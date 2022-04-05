//
//  Person.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class Person {
    var mName: String
    var mId: Int

    init(_ n: String = "Hello", _ p: Int = -1) {
        mName = n
        mId = p
    }

    var name: String {
        set(newName) {
            mName = newName
        }
        get {
            return mName
        }
    }

}
