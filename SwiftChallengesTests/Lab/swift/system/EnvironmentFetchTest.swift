//
//  EnvironmentFetchTest.swift
//  SwiftCodesTests
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import XCTest

class EnvironmentFetchTest: XCTestCase {

    func testBasic() {
        let key = "PATH"
        let value = EnvironmentFetch.get(name: key)
        print("====== [\(key)] ======")
        print("============")
        print("\(value)")
        print("============")
    }

}
