//
//  SortByCriteriaTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/9/22.
//

import XCTest

class SortByCriteriaTest: XCTestCase {
    func testBasic01() throws {
        let input = [
            TripletThing(2,130,1100),
            TripletThing(1,140,1500),
            TripletThing(1,110,1400),
            TripletThing(2,150,1300),
            TripletThing(2,120,1200),
        ]

        let sbc = SortByCriteria()
        let result = sbc.sortBy(input: input)

        for triple in result {
            print("===== [\(triple.a)]-[\(triple.b)]-[\(triple.c)] =====")
        }
    }
}
