//
//  StockTradingTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/10/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class StockTradingTest: XCTestCase {

    func testBasic() throws {
        let input = [7, 1, 5, 3, 6, 4]
        let expected = 5
        let actual = StockTrading.maxProfit(price: input)
        XCTAssertEqual(expected, actual)
    }

}
