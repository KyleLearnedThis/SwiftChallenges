//
//  FibonacciTest.swift
//  SwiftExercisesTests
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.

import XCTest

class FibonacciTest: XCTestCase {
    var fibonacci = Fibonacci()

    func testFibonacciRecursion() {
        let actual = fibonacci.v1(n: 6)
        let expected = 8
        XCTAssertEqual(actual, expected)
    }

    func testFibonacciMap() {
        let actual = fibonacci.v2(n: 6)
        let expected = 8
        XCTAssertEqual(actual, expected)
    }
}
