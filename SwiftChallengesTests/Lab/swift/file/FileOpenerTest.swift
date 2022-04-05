//
//  FileOpenerTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class FileOpenerTest: XCTestCase {

    func testBasic() {
        let dir = "dev/iOS/SwiftCodes/SwiftCodesTests/swift/file/resources/"
        let fileName = "test02.txt"
        let x = FileOpener()
        _ = x.openHomeFile(inputDirectory: dir, fileName: fileName)
    }

    func testOpenFileAsJson() {
        let dir = "dev/iOS/SwiftCodes/SwiftCodesTests/swift/file/resources/"
        let fileName = "test04.json"
        let x = FileOpener()
        x.parseGraphJsonFile(inputDirectory: dir, fileName: fileName)
    }
}
