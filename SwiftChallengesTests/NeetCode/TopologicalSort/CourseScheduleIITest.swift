//
//  CourseScheduleIITest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/24/26.
//

import XCTest

class CourseScheduleIITest: XCTestCase {

    private let sut = CourseScheduleII()

    // Topological order isn't unique, so we can't compare against one fixed expected
    // array. Instead, check the result is a complete permutation of all courses AND
    // that every prerequisite appears before the course that depends on it.
    private func isValidOrder(_ order: [Int], numCourses: Int, prerequisites: [[Int]]) -> Bool {
        // Must contain every course exactly once
        guard order.count == numCourses, Set(order) == Set(0..<numCourses) else { return false }
        // Map each course to its index in the order, so we can compare positions
        var position = [Int: Int]()
        for (index, course) in order.enumerated() {
            position[course] = index
        }
        // For every [course, prereq] pair, prereq's position must come before course's
        for prerequisite in prerequisites {
            let course = prerequisite[0]
            let prereq = prerequisite[1]
            guard let coursePosition = position[course], let prereqPosition = position[prereq], prereqPosition < coursePosition else {
                return false
            }
        }
        return true
    }

    // When expectValidOrder is true, any correctly-ordered permutation passes.
    // When false, the graph has a cycle, so the only correct result is an empty array.
    private func verify(_ numCourses: Int, _ prerequisites: [[Int]], expectValidOrder: Bool, file: StaticString = #filePath, line: UInt = #line) {
        let result = sut.findOrder(numCourses, prerequisites)
        if expectValidOrder {
            XCTAssertTrue(isValidOrder(result, numCourses: numCourses, prerequisites: prerequisites), file: file, line: line)
        } else {
            XCTAssertEqual(result, [], file: file, line: line)
        }
    }

    // MARK: - Base cases

    func testSingleCourseNoPrerequisites() {
        verify(1, [], expectValidOrder: true)
    }

    func testMultipleCoursesNoPrerequisites() {
        verify(3, [], expectValidOrder: true)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(2, [[1, 0]], expectValidOrder: true)
    }

    func testExample2() {
        verify(4, [[1, 0], [2, 0], [3, 1], [3, 2]], expectValidOrder: true)
    }

    func testExample3() {
        verify(1, [], expectValidOrder: true)
    }

    // MARK: - Edge cases

    func testTwoCourseCycleReturnsEmpty() {
        verify(2, [[1, 0], [0, 1]], expectValidOrder: false)
    }

    func testLargerCycleReturnsEmpty() {
        verify(3, [[1, 0], [2, 1], [0, 2]], expectValidOrder: false)
    }

    func testDisconnectedComponents() {
        verify(5, [[1, 0], [3, 2]], expectValidOrder: true)
    }

    func testChainOfPrerequisites() {
        verify(4, [[1, 0], [2, 1], [3, 2]], expectValidOrder: true)
    }
}
