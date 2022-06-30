//
//  MaximumFrequencyStackTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/28/22.
//

import XCTest

class MaximumFrequencyStackTest: XCTestCase {
    func testBasic01() throws {
        let stack = MaximumFrequencyStack()
        let input = [5,7,5,7,4,5]
        stack.push(input)
        printStack(stack)
    }

    func testBasic02() throws {
        let stack = MaximumFrequencyStack()
        let input = [5,7,5,7,4,5]
        stack.push(input)

        printStack(stack)

        var expectedFreq = 5
        var actualFreq = stack.pop()
        XCTAssertEqual(expectedFreq, actualFreq)

        printStack(stack)

        expectedFreq = 7
        actualFreq = stack.pop()
        XCTAssertEqual(expectedFreq, actualFreq)

        printStack(stack)
    }

    private func printStack(_ stack: MaximumFrequencyStack) {
        stack.printAll()
        stack.printFrequency()
        print("================")
    }

}
