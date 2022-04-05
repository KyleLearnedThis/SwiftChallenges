//
//  IPDefangerTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class IPDefangerTest: XCTestCase {

    func testBasic() {
        let idp = IPDefanger()
        let input: String = "1.1.1.1"
        let actual = idp.defangIPaddr(input)
        let expected = "1[.]1[.]1[.]1"
        XCTAssertEqual(actual, expected)
    }

}
