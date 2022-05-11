//
//  StudentGradingTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/10/22.
//

import XCTest

class StudentGradingTest: XCTestCase {
    func testBasic01() throws {
        let input = [73,67,38,33]
        let expected = [75, 67, 40, 33]
        let actual = StudentGrading.gradingStudents(grades: input)
        XCTAssertEqual(expected, actual)
    }
}
