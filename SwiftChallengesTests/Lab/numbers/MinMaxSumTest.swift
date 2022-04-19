//
//  MinMaxSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/15/22.
//

import XCTest

class MinMaxSumTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let input = [1,3,5,7,9]
        let minExpected = 16
        let maxExpected = 24
        let actual = MinMaxSum.bothSum(arr: input)
        let minActual = actual.0
        let maxActual = actual.1
        XCTAssertEqual(minExpected, minActual)
        XCTAssertEqual(maxExpected, maxActual)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testFoo() {
        let arr = [1,2,3,4,5]
        let d = 2
        var result = [Int]()
        let steps: Int = d % arr.count
        let leftPart = Array(arr[0..<steps])
        let rightPart = Array(arr[steps..<arr.count])
        result.append(contentsOf: rightPart)
        result.append(contentsOf: leftPart)
//        return result
    }
}
