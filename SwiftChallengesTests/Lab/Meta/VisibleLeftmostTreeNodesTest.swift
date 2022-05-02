//
//  VisibleLeftmostTreeNodesTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/1/22.
//

import XCTest

class VisibleLeftmostTreeNodesTest: XCTestCase {
    func testBasic01() throws {
        let expected = 4
        let root: WidgetNode? = WidgetNode(8,
                         left: WidgetNode(3,
                                    left: WidgetNode(1),
                                    right: WidgetNode(6,
                                                left: WidgetNode(4),
                                                right: WidgetNode(7))),
                         right: WidgetNode(10,
                                     right: WidgetNode(14,
                                                 left: WidgetNode(13))))
        BinaryTreePrinter<Int>.printNode(root: root!)
        let actual = root?.visibleNodes
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let expected = 5
        let root: WidgetNode? = WidgetNode(10,
                         left: WidgetNode(8,
                                    left: WidgetNode(4,
                                               right: WidgetNode(5,
                                                           right: WidgetNode(6)))),
                         right: WidgetNode(15,
                                     left: WidgetNode(14),
                                     right: WidgetNode(16)))
        BinaryTreePrinter<Int>.printNode(root: root!)
        let actual = root?.visibleNodes
        XCTAssertEqual(expected, actual)
    }
}
