////
////  ListReverseTest.swift
////  SwiftCodesTests
////
////  Copyright © 2019 kylelearnedthis. All rights reserved.
////
//
//import XCTest
//
//class ListReverseTest: XCTestCase {
//
//    func testBasic() {
//        let input = [1,3,5,7,9]
//        let list = LinkedList<Int>(input: input)
//        print("======= Before =======")
//        list.printList()
//
//        let head = list.getHead()
//        var x = ListReverse.reverse(node: head)
//        print("======= After =======")
//        while x != nil {
//            let value = x?.getValue()
//            print("[\(value!)]", terminator: " ")
//            x = x?.next
//        }
//        print("")
//    }
//
//}
