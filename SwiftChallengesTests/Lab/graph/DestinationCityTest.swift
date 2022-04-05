//
//  DestinationCityTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/16/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class DestinationCityTest: XCTestCase {

    func testBasic() throws {
        let input = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
        let expected = "Sao Paulo"
        let actual = DestinationCity.destCity(input)
        XCTAssertEqual(expected, actual)
    }

}
