//
//  FindAllPairsGivenSumTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 1/20/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//

import XCTest

class FindAllPairsGivenSumTest: XCTestCase {

    func testBasic() throws {
        let a = [1, 2, 4, 5, 7]
        let b = [5, 6, 3, 4, 8]
        let n = 9
        let o = [[1,8],[4,5],[5,4]]
        let actual = FindAllPairsGivenSum.allPairs(a,b,n)
        findAllPairsWork(a,b,n,o,actual)
    }

    func testBasicV2() throws {
        let a = [1, 2, 4, 5, 7]
        let b = [5, 6, 3, 4, 8]
        let n = 9
        let o = [[1,8],[4,5],[5,4]]
        let actual = FindAllPairsGivenSum.allPairsV2(a,b,n)
        findAllPairsWork(a,b,n,o,actual)
    }

    func testNegativeNumbers() throws {
        let a = [-1, -2, 4, -6, 5, 7]
        let b = [6, 3, 4, 0]
        let n = 8
        let o = [[4,4],[5,3]]
        let actual = FindAllPairsGivenSum.allPairs(a,b,n)
        findAllPairsWork(a,b,n,o,actual)
    }

    func testNegativeNumbersV2() throws {
        let a = [-1, -2, 4, -6, 5, 7]
        let b = [6, 3, 4, 0]
        let n = 8
        let o = [[4,4],[5,3]]
        let actual = FindAllPairsGivenSum.allPairsV2(a,b,n)
        findAllPairsWork(a,b,n,o,actual)
    }

    private func findAllPairsWork(_ a: [Int], _ b: [Int], _ n: Int, _ o: [[Int]], _ actual: [(l: Int, r: Int)] ) {
        let expected = generateExpectedArray(array: o)
        XCTAssertTrue(expected.count == actual.count)
        for i in expected.indices {
            let ex = expected[i]
            let ac = actual[i]
            XCTAssertEqual(ex.l, ac.l)
            XCTAssertEqual(ex.r, ac.r)
        }
    }

    func generateExpectedArray(array: [[Int]]) -> [(l: Int, r: Int)]{
        var result = [(l: Int, r: Int)]()
        for row in array {
            let l = row.first!
            let r = row.last!
            let tuple = (l,r)
            result.append(tuple)
        }
        return result
    }
}
