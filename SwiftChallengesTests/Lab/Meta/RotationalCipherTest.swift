//
//  RotationalCipherTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/12/22.
//

import XCTest

class RotationalCipherTest: XCTestCase {

    func testBasicV01() throws {
        let input = "Zebra-493?"
        let expected = "Cheud-726?"
        let cph = RotationalCipher(backing: input)
        let actual = cph.cipher(withRotationFactor: 4)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02() throws {
        let input = "All-convoYs-9-be:Alert1."
        let expected = "Epp-gsrzsCw-3-fi:Epivx5."
        let cph = RotationalCipher(backing: input)
        let actual = cph.cipher(withRotationFactor: 4)
        XCTAssertEqual(expected, actual)
    }

}
