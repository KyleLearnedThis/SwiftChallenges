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
        _ = GraphUtils.parseGraphJsonFile(inputDirectory: dir, fileName: fileName)
    }

}
