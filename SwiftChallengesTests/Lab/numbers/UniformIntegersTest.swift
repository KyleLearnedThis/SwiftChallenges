//
//  UniformIntegersTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/20/22.
//

import XCTest

class UniformIntegersTest: XCTestCase {

    func testBasicV01_01() throws {
        let a = 75
        let b = 300
        let expected = 5
        let actual = UniformIntegers.getUniformIntegerCountInIntervalV1(a, b)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV01_02() throws {
        let a = 1
        let b = 9
        let expected = 9
        let actual = UniformIntegers.getUniformIntegerCountInIntervalV1(a, b)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV01_03() throws {
        let a = 999999999999
        let b = 999999999999
        let expected = 1
        let actual = UniformIntegers.getUniformIntegerCountInIntervalV1(a, b)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02_01() throws {
        let a = 75
        let b = 300
        let expected = 5
        let actual = UniformIntegers.getUniformIntegerCountInIntervalV2(a, b) {
            UniformIntegers.isUniformV1($0)
        }
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02_02() throws {
        let a = 1
        let b = 9
        let expected = 9
        let actual = UniformIntegers.getUniformIntegerCountInIntervalV2(a, b) {
            UniformIntegers.isUniformV1($0)
        }
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02_03() throws {
        let a = 999999999999
        let b = 999999999999
        let expected = 1
        let actual = UniformIntegers.getUniformIntegerCountInIntervalV2(a, b) {
            UniformIntegers.isUniformV1($0)
        }
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02_04() throws {
        let a = 75
        let b = 300
        let expected = 5
        let actual = UniformIntegers.getUniformIntegerCountInIntervalV2(a, b) {
            UniformIntegers.isUniformV2($0)
        }
        XCTAssertEqual(expected, actual)
    }

    func testUniformNumber01() throws {
        let input = 999
        let expected = true
        let actual = UniformIntegers.isUniformNumber(input)
        XCTAssertEqual(expected, actual)
    }
}
