//
//  CourseScheduleTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/20/26.
//

import XCTest

class CourseScheduleTest: XCTestCase {

    private let sut = CourseSchedule()

    private func verify(_ numCourses: Int, _ prerequisites: [[Int]], expected: Bool, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.canFinish(numCourses, prerequisites), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testZeroCourses() {
        verify(0, [], expected: true)
    }

    func testOneCourseNoPrereqs() {
        verify(1, [], expected: true)
    }

    func testTwoCoursesNoPrereqs() {
        verify(2, [], expected: true)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(2, [[1, 0]], expected: true)
    }

    func testExample2() {
        verify(2, [[1, 0], [0, 1]], expected: false)
    }

    // MARK: - Edge cases

    func testSelfLoop() {
        verify(1, [[0, 0]], expected: false)
    }

    func testLargerCycle() {
        verify(4, [[1, 0], [2, 1], [3, 2], [0, 3]], expected: false)
    }

    func testChainNoCycle() {
        verify(4, [[1, 0], [2, 1], [3, 2]], expected: true)
    }

    func testDisconnectedWithCycle() {
        verify(4, [[1, 0], [3, 2], [2, 3]], expected: false)
    }

    func testManyPrereqsSingleSink() {
        verify(5, [[0, 4], [1, 4], [2, 4], [3, 4]], expected: true)
    }
}
