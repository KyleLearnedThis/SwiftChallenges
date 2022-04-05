//
//  RegexTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class RegexTest: XCTestCase {

    func testBasic() {
        let input = "415-123-4567"
        switch input {
        case Regex.phone:
            print("So call me maybe: \(input)")
        default:
            print("An unknown format.")
        }
    }

}
