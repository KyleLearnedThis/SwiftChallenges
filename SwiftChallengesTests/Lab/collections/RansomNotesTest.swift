//
//  RnasomNotesTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 5/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class RansomNotesTest: XCTestCase {

    func testBasic() throws {
        let expected = true
        let magazine = "give me one grand today night".components(separatedBy: " ")
        let notes = "give one grand today".components(separatedBy: " ")
        let actual = RansomNotes.checkMagazineWork(magazine: magazine, note: notes)
        XCTAssertEqual(expected, actual)
    }

}
