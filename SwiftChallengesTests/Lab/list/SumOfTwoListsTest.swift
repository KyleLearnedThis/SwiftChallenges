////
////  SumOfTwoListsTest.swift
////  SwiftCodesTests
////
////  Created by KyleLearnedThis on 1/27/22.
////  Copyright © 2022 kylelearnedthis. All rights reserved.
////  https://leetcode.com/problems/add-two-numbers/
//
//import XCTest
//
//class SumOfTwoListsTest: XCTestCase {
//
//    func testBasic() throws {
//        let x = [2,4,3]
//        let y = [5,6,4]
//        let l1 = LinkedList(input: x)
//        let l2 = LinkedList(input: y)
//        let actual = SumOfTwoLists.addTwoNumbers(l1.getHead(), l2.getHead())
//        printList(actual)
//    }
//
//    private func printList(_ head: Node<Int>?) {
//        var cur = head
//        while(cur != nil) {
//            let value = String(describing: cur!.getValue())
//            print("[ \(value) ]")
//            cur = cur?.next
//        }
//    }
//}
