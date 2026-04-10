//
//  DijkstraTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class DijkstraTest: XCTestCase {

    func testBasic() {
        let dir = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()   // algorithm/
            .deletingLastPathComponent()   // graph/
            .appendingPathComponent("resources")
            .path + "/"
        let fileName = "test02.json"
        let dijkstra = Dijkstra(inputDir: dir, fileName: fileName)
        let source = "1"
        let target = "4"
        let expectedCost = 14
        let (path, actualCost) = dijkstra.findShortestDistance(source: source, target: target)

        for i in 0..<path.count {
            let value = path[i].id
            if i != path.count - 1 {
                print("[\(value)]-", terminator: "")
            }  else {
                print("[\(value)]", terminator: "")
            }
        }
        print("")
        XCTAssertEqual(actualCost, expectedCost)
    }

}
