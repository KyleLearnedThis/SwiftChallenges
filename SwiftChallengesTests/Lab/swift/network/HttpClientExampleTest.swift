//
//  HttpClientExampleTest.swift
//  SwiftCodesTests
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import XCTest

class HttpClientExampleTest: XCTestCase {

    func testExample() {
        let urlString = "http://www.stackoverflow.com"
        HttpClientExample.get(url: urlString)
    }

}
