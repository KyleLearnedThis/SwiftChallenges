//
//  SimpleLinkedListTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/27/22.
//

import XCTest

class SimpleLinkedListTest: XCTestCase {
    func testBasic01() throws {
        let input = [1,2,3,4,5,6,7]
        let list = SimpleLinkedList()
        for num in input {
            list.append(value: num)
        }
        list.display()
    }
}
