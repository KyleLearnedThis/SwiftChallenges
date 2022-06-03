//
//  TrieTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/3/22.
//

import XCTest

class TrieTest: XCTestCase {
    func testBasic01() throws {
        let trie = Trie()
        var actual = false
        let word = "cute"
        trie.insert(word: word)
        actual = trie.contains(word: word)
        XCTAssertEqual(true, actual)
    }
}
