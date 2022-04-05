//
//  FizzBuzzTest.swift
//  SwiftExercisesTests
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import XCTest


class FizzBuzzTest: XCTestCase {
    var fizz = FizzBuzz()

    func testBasic() {
        let actual = fizz.fizzBuzzV1(number: 15)
        let expected = ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]
        assert(actual.elementsEqual(expected))
    }

    func testBasicV2() {
        let actual = fizz.fizzBuzzV2(number: 15)
        let expected = ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]
        assert(actual.elementsEqual(expected))
    }
}
