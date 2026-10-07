//
//  FindMedianFromDataStreamTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/27/26.
//  https://leetcode.com/problems/find-median-from-data-stream/

import XCTest

class FindMedianFromDataStreamTest: XCTestCase {

    private func verify(
        _ sut: FindMedianFromDataStream,
        _ expected: Double,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        XCTAssertEqual(sut.findMedian(), expected, accuracy: 0.00001, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElement() {
        let sut = FindMedianFromDataStream()
        sut.addNum(1)
        verify(sut, 1.0)
    }

    func testTwoElements() {
        let sut = FindMedianFromDataStream()
        sut.addNum(1)
        sut.addNum(2)
        verify(sut, 1.5)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        let sut = FindMedianFromDataStream()
        sut.addNum(1)
        sut.addNum(2)
        verify(sut, 1.5)
        sut.addNum(3)
        verify(sut, 2.0)
    }

    // MARK: - Edge cases

    func testDescendingInput() {
        let sut = FindMedianFromDataStream()
        sut.addNum(5)
        sut.addNum(4)
        sut.addNum(3)
        sut.addNum(2)
        sut.addNum(1)
        verify(sut, 3.0)
    }

    func testDuplicates() {
        let sut = FindMedianFromDataStream()
        sut.addNum(2)
        sut.addNum(2)
        sut.addNum(2)
        verify(sut, 2.0)
    }

    func testNegativeValues() {
        let sut = FindMedianFromDataStream()
        sut.addNum(-5)
        sut.addNum(-1)
        verify(sut, -3.0)
        sut.addNum(-10)
        verify(sut, -5.0)
    }

    func testMedianAfterEachInsertion() {
        let sut = FindMedianFromDataStream()
        sut.addNum(6)
        verify(sut, 6.0)
        sut.addNum(10)
        verify(sut, 8.0)
        sut.addNum(2)
        verify(sut, 6.0)
        sut.addNum(6)
        verify(sut, 6.0)
        sut.addNum(5)
        verify(sut, 6.0)
    }
}
