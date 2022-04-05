//
//  BusyStudentTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 7/7/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class BusyStudentTest: XCTestCase {

    func testExample() throws {
        let startTime = [1,2,3]
        let endTime = [3,2,7]
        let queryTime = 4
        let expected = 1
        let acutal = BusyStudent.busyStudent(startTime, endTime, queryTime)
        XCTAssertEqual(expected, acutal)
    }

}
