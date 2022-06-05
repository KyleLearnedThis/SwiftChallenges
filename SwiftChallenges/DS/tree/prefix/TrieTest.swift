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

    func testPrefix01() throws {
        let trie = Trie()
        let input = ["apple", "appletini", "app", "apply", "application"]
        for word in input {
            trie.insert(word: word)
        }

        let node = trie.getPrefix(word: "app")
        let expected = "app"
        let actual = trie.getPrefixString(node: node)
        print("actual: [\(actual)]")
        XCTAssertEqual(expected, actual)
    }

    func testPrefixPaths01() throws {
        let trie = Trie()
        let input = ["appletouch", "appletini", "bee", "begin"]
        for word in input {
            trie.insert(word: word)
        }

        let node = trie.getPrefix(word: "app")
        let expected = "app"
        let actual = trie.getPrefixString(node: node)
        print("actual: [\(actual)]")
        XCTAssertEqual(expected, actual)

        let results = trie.getAllPaths(node: node)

        for word in results {
            print("[\(word)]", terminator: " ")
        }
        print("")
    }
}
