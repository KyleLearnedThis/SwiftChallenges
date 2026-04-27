//
//  GroupAnagramsTest.swift
//  InterviewPrepTests
//
//  Created by KyleLearnedThis on 4/18/26.
//

import XCTest

class GroupAnagramsTest: XCTestCase {
    let ga = GroupAnagrams()

    func normalize(_ groups: [[String]]) -> [[String]] {
        groups.map { $0.sorted() }.sorted { $0[0] < $1[0] }
    }

    func testGroupAnagrams() {
        let strs = ["eat","tea","tan","ate","nat","bat"]
        let expected = [["ate","eat","tea"],["bat"],["nat","tan"]]
        XCTAssertEqual(normalize(ga.groupAnagrams(strs)), normalize(expected))
    }

    func testSingleWord() {
        XCTAssertEqual(normalize(ga.groupAnagrams(["a"])), [["a"]])
    }

    func testAllSameAnagram() {
        let strs = ["abc","bca","cab"]
        XCTAssertEqual(normalize(ga.groupAnagrams(strs)), [["abc","bca","cab"]])
    }

    func testEmptyString() {
        XCTAssertEqual(normalize(ga.groupAnagrams([""])), [[""]])
    }
}
