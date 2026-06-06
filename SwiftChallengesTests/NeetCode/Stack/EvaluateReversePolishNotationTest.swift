//
//  EvaluateReversePolishNotationTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/6/26.
//

import XCTest

class EvaluateReversePolishNotationTest: XCTestCase {

    // LeetCode example 1: ["2","1","+","3","*"] -> 9
    func testLeetCodeExample1() {
        let sut = EvaluateReversePolishNotation()
        XCTAssertEqual(sut.evalRPN(["2", "1", "+", "3", "*"]), 9)
    }

    // LeetCode example 2: ["4","13","5","/","+"] -> 6
    func testLeetCodeExample2() {
        let sut = EvaluateReversePolishNotation()
        XCTAssertEqual(sut.evalRPN(["4", "13", "5", "/", "+"]), 6)
    }

    // LeetCode example 3: nested expression with negatives -> 22
    func testLeetCodeExample3() {
        let sut = EvaluateReversePolishNotation()
        XCTAssertEqual(sut.evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]), 22)
    }

    // Single token: just a number
    func testSingleNumber() {
        let sut = EvaluateReversePolishNotation()
        XCTAssertEqual(sut.evalRPN(["42"]), 42)
    }

    // Division truncates toward zero (not floor): -7/2 = -3, not -4
    func testDivisionTruncatesTowardZero() {
        let sut = EvaluateReversePolishNotation()
        XCTAssertEqual(sut.evalRPN(["-7", "2", "/"]), -3)
    }

    // Subtraction produces a negative result
    func testSubtractionNegativeResult() {
        let sut = EvaluateReversePolishNotation()
        XCTAssertEqual(sut.evalRPN(["3", "11", "-"]), -8)
    }

    // Negative operands with multiplication
    func testNegativeOperandsMultiply() {
        let sut = EvaluateReversePolishNotation()
        XCTAssertEqual(sut.evalRPN(["-3", "-4", "*"]), 12)
    }
}
