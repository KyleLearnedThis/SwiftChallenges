//
//  MeetingRoomsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/20/26.
//

import XCTest

class MeetingRoomsTest: XCTestCase {

    private let sut = MeetingRooms()

    private func verify(_ intervals: [[Int]], _ expected: Bool, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.canAttendMeetings(intervals), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testEmpty() {
        verify([], true)
    }

    func testSingleMeeting() {
        verify([[7, 10]], true)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        // Overlap between [0,30] and [5,10] -> cannot attend all
        verify([[0, 30], [5, 10], [15, 20]], false)
    }

    func testExample2() {
        // No overlap -> can attend all
        verify([[7, 10], [2, 4]], true)
    }

    // MARK: - Edge cases

    func testTouchingEndpointsAllowed() {
        // One meeting ends exactly when the next begins -> no conflict
        verify([[1, 5], [5, 10], [10, 15]], true)
    }

    func testUnsortedWithOverlap() {
        verify([[10, 20], [2, 6], [4, 9]], false)
    }

    func testIdenticalMeetings() {
        verify([[1, 5], [1, 5]], false)
    }
}
