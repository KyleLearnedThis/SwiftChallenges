//
//  ComputeClosureTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 6/23/20.
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import XCTest

class ComputeClosureTest: XCTestCase {

    func testAdd() {
        let cc = ComputeClosure()
        cc.addOne(input: 1) { x in
            print("Step 1: input is \(x)")
            return x
        }
        print("===== \(cc.result) =====")
        XCTAssertEqual(cc.result, 2)
    }

    func testAddBoth() {
        let x = 1
        let y = 2
        let cc = ComputeClosure()
        let result = cc.add(x: x, y: y) { x, y in
            x + y
        }
        print("===== \(result) =====")
        XCTAssertEqual(result, 3)
    }
}
