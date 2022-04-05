//
//  MakeSoundTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class MakeSoundTest: XCTestCase {
    func testMakingSound() {
        var s = [Sound]()
        s.append(Dog())
        s.append(Phone())
        s.append(Cat())
        s.append(Car())
        for i in s {
            i.makeSound()
        }
    }
}
