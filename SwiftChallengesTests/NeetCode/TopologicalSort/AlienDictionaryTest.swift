//
//  AlienDictionaryTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/27/26.
//

import XCTest

class AlienDictionaryTest: XCTestCase {

    private let sut = AlienDictionary()

    private func isValidOrder(_ words: [String], _ order: String) -> Bool {
        var rank = [Character: Int]()
        for (i, c) in order.enumerated() { rank[c] = i }
        for i in 0..<words.count - 1 {
            let w1 = Array(words[i]), w2 = Array(words[i + 1])
            var found = false
            for j in 0..<min(w1.count, w2.count) {
                guard let r1 = rank[w1[j]], let r2 = rank[w2[j]] else { return false }
                if r1 < r2 { found = true; break }
                if r1 > r2 { return false }
            }
            if !found && w1.count > w2.count { return false }
        }
        return true
    }

    private func verify(_ words: [String], file: StaticString = #file, line: UInt = #line) -> String {
        sut.alienOrder(words)
    }

    // MARK: - Base cases

    func testSingleWord() {
        let result = verify(["abc"])
        XCTAssertEqual(Set(result), Set("abc"))
    }

    func testSingleCharWord() {
        XCTAssertEqual(verify(["a"]), "a")
    }

    func testTwoIdenticalWords() {
        let result = verify(["z", "z"])
        XCTAssertEqual(result, "z")
    }

    // MARK: - LeetCode examples

    func testExample1() {
        let words = ["wrt", "wrf", "er", "ett", "rftt"]
        let result = verify(words)
        XCTAssertTrue(isValidOrder(words, result), "Expected valid ordering, got: \(result)")
        XCTAssertEqual(result.count, 5)
    }

    func testExample2() {
        XCTAssertEqual(verify(["z", "x"]), "zx")
    }

    func testExample3() {
        XCTAssertEqual(verify(["z", "x", "z"]), "")
    }

    // MARK: - Edge cases

    func testPrefixAfterLongerWord() {
        XCTAssertEqual(verify(["abc", "ab"]), "")
    }

    func testCycleDetection() {
        XCTAssertEqual(verify(["b", "a", "b"]), "")
    }

    func testTwoLetterOrdering() {
        let words = ["ba", "bc", "ac", "ca"]
        let result = verify(words)
        XCTAssertTrue(isValidOrder(words, result), "Expected valid ordering, got: \(result)")
    }
}
