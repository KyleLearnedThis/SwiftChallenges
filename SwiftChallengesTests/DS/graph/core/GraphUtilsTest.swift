//
//  GraphUtilsTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class GraphUtilsTest: XCTestCase {

    func testBasic() {
        let dir = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()   // core/
            .deletingLastPathComponent()   // graph/
            .appendingPathComponent("resources")
            .path + "/"
        let fileName = "test02.json"
        let result = GraphUtils.parseGraphJsonFile(inputDirectory: dir, fileName: fileName)
        XCTAssertEqual(result.count, 4)
        XCTAssertNotNil(result["1"])
    }

}
