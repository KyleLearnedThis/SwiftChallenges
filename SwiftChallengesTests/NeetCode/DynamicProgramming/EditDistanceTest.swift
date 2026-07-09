//
//  EditDistanceTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/7/26.
//

import XCTest

class EditDistanceTest: XCTestCase {

    private let sut = EditDistance()

    private func verify(_ word1: String, _ word2: String, expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.minDistance(word1, word2), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testBothEmpty() {
        verify("", "", expected: 0)
    }

    func testFirstEmpty() {
        verify("", "abc", expected: 3)
    }

    func testSecondEmpty() {
        verify("abc", "", expected: 3)
    }

    func testIdenticalWords() {
        verify("abc", "abc", expected: 0)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify("horse", "ros", expected: 3)
    }

    func testExample2() {
        verify("intention", "execution", expected: 5)
    }

    // MARK: - Edge cases

    func testSingleCharacterReplace() {
        verify("a", "b", expected: 1)
    }

    func testSingleCharacterInsert() {
        verify("", "a", expected: 1)
    }

    func testSingleCharacterDelete() {
        verify("a", "", expected: 1)
    }

    func testOneInsertOnly() {
        verify("abc", "abcd", expected: 1)
    }

    func testOneDeleteOnly() {
        verify("abcd", "abc", expected: 1)
    }

    func testCompletelyDifferentWords() {
        verify("abcdef", "ghijkl", expected: 6)
    }
}
