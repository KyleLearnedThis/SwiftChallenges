//
//  NeetWordLadderTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/14/26.
//

import XCTest

class NeetWordLadderTest: XCTestCase {

    private let sut = NeetWordLadder()

    // MARK: - LeetCode examples

    // hit → hot → dot → dog → cog (5 words)
    func testExample1() {
        XCTAssertEqual(
            sut.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]),
            5
        )
    }

    // endWord "cog" not in wordList → no path
    func testExample2() {
        XCTAssertEqual(
            sut.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]),
            0
        )
    }

    // MARK: - Base cases

    func testEmptyWordList() {
        XCTAssertEqual(sut.ladderLength("hit", "cog", []), 0)
    }

    func testEndWordNotInList() {
        XCTAssertEqual(sut.ladderLength("abc", "xyz", ["ayz", "axz", "abz"]), 0)
    }

    // One character change, endWord directly reachable
    func testDirectTransformation() {
        XCTAssertEqual(sut.ladderLength("hot", "dot", ["dot"]), 2)
    }

    // beginWord already one step from endWord via a different word in list
    func testTwoStepPath() {
        XCTAssertEqual(sut.ladderLength("hot", "log", ["lot", "log"]), 3)
    }

    // MARK: - No valid path

    // No word in list bridges the gap
    func testNoPath() {
        XCTAssertEqual(sut.ladderLength("hit", "cog", ["hot", "cog"]), 0)
    }

    // wordList contains endWord but no bridge words
    func testIsolatedEndWord() {
        XCTAssertEqual(sut.ladderLength("abc", "xyz", ["xyz"]), 0)
    }

    // MARK: - Shortest path selection

    // Two routes exist; function must return the shorter one
    // Short: a→b→c (3), Long: a→d→e→c (4)
    func testShortestOfTwoPaths() {
        // "aaa" → "baa" → "bba" OR "aaa" → "aba" → "bba"
        // all reachable in 3; confirm we don't return 4
        XCTAssertEqual(
            sut.ladderLength("aaa", "bba", ["baa", "bba", "aba"]),
            3
        )
    }

    // MARK: - Single-character words

    func testSingleCharDirectMatch() {
        XCTAssertEqual(sut.ladderLength("a", "b", ["b"]), 2)
    }

    func testSingleCharNoPath() {
        XCTAssertEqual(sut.ladderLength("a", "c", ["b"]), 0)
    }

    // MARK: - Dead-end branches

    // wordList has a dead-end branch that doesn't lead to endWord
    func testDeadEndBranchIgnored() {
        // "hit" → "hot" → "dot" → "dog" → "cog"
        // "dot" → "lot" → "log" is a dead end (no "cog" reachable from "log" without "cog" in list)
        XCTAssertEqual(
            sut.ladderLength("hit", "cog", ["hot", "dot", "dog", "cog", "lot", "log"]),
            5
        )
    }

    // MARK: - Longer chain

    func testLongerChain() {
        // a → b → c → d → e, each differing by one letter
        // "aaaa" → "baaa" → "bbaa" → "bbba" → "bbbb"
        let wordList = ["baaa", "bbaa", "bbba", "bbbb"]
        XCTAssertEqual(sut.ladderLength("aaaa", "bbbb", wordList), 5)
    }

    // MARK: - V2 (pattern map) LeetCode examples

    func testV2Example1() {
        XCTAssertEqual(
            sut.ladderLengthWildcardAdjacency("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]),
            5
        )
    }

    func testV2Example2() {
        XCTAssertEqual(
            sut.ladderLengthWildcardAdjacency("hit", "cog", ["hot", "dot", "dog", "lot", "log"]),
            0
        )
    }

    // MARK: - V2 Base cases

    func testV2EmptyWordList() {
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("hit", "cog", []), 0)
    }

    func testV2EndWordNotInList() {
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("abc", "xyz", ["ayz", "axz", "abz"]), 0)
    }

    func testV2DirectTransformation() {
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("hot", "dot", ["dot"]), 2)
    }

    func testV2TwoStepPath() {
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("hot", "log", ["lot", "log"]), 3)
    }

    // MARK: - V2 No valid path

    func testV2NoPath() {
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("hit", "cog", ["hot", "cog"]), 0)
    }

    func testV2IsolatedEndWord() {
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("abc", "xyz", ["xyz"]), 0)
    }

    // MARK: - V2 Shortest path selection

    func testV2ShortestOfTwoPaths() {
        XCTAssertEqual(
            sut.ladderLengthWildcardAdjacency("aaa", "bba", ["baa", "bba", "aba"]),
            3
        )
    }

    // MARK: - V2 Single-character words

    func testV2SingleCharDirectMatch() {
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("a", "b", ["b"]), 2)
    }

    func testV2SingleCharNoPath() {
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("a", "c", ["b"]), 0)
    }

    // MARK: - V2 Dead-end branches

    func testV2DeadEndBranchIgnored() {
        XCTAssertEqual(
            sut.ladderLengthWildcardAdjacency("hit", "cog", ["hot", "dot", "dog", "cog", "lot", "log"]),
            5
        )
    }

    // MARK: - V2 Longer chain

    func testV2LongerChain() {
        let wordList = ["baaa", "bbaa", "bbba", "bbbb"]
        XCTAssertEqual(sut.ladderLengthWildcardAdjacency("aaaa", "bbbb", wordList), 5)
    }
}
