//
//  NeetNumberOfIslandsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/13/26.
//

import XCTest

class NeetNumberOfIslandsTest: XCTestCase {

    private let sut = NeetNumberOfIslands()

    // MARK: - Base cases

    func testAllWater() {
        let grid: [[Character]] = [
            ["0", "0"],
            ["0", "0"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 0)
    }

    func testAllLand() {
        let grid: [[Character]] = [
            ["1", "1"],
            ["1", "1"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 1)
    }

    func testSingleLandCell() {
        XCTAssertEqual(sut.numIslands([["1"]]), 1)
    }

    func testSingleWaterCell() {
        XCTAssertEqual(sut.numIslands([["0"]]), 0)
    }

    // MARK: - LeetCode examples

    // One large connected island
    func testExample1() {
        let grid: [[Character]] = [
            ["1", "1", "1", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "0", "0", "0"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 1)
    }

    // Three separate islands
    func testExample2() {
        let grid: [[Character]] = [
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "1", "0", "0"],
            ["0", "0", "0", "1", "1"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 3)
    }

    // MARK: - Single row / single column

    func testSingleRowAllLand() {
        let grid: [[Character]] = [["1", "1", "1"]]
        XCTAssertEqual(sut.numIslands(grid), 1)
    }

    func testSingleRowAlternating() {
        let grid: [[Character]] = [["1", "0", "1", "0", "1"]]
        XCTAssertEqual(sut.numIslands(grid), 3)
    }

    func testSingleColumnAllLand() {
        let grid: [[Character]] = [["1"], ["1"], ["1"]]
        XCTAssertEqual(sut.numIslands(grid), 1)
    }

    func testSingleColumnAlternating() {
        let grid: [[Character]] = [["1"], ["0"], ["1"], ["0"], ["1"]]
        XCTAssertEqual(sut.numIslands(grid), 3)
    }

    // MARK: - Connectivity

    // Diagonal land cells are NOT connected (only 4-directional)
    func testDiagonalLandIsNotConnected() {
        let grid: [[Character]] = [
            ["1", "0"],
            ["0", "1"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 2)
    }

    // Each corner is a separate island
    func testFourCornerIslands() {
        let grid: [[Character]] = [
            ["1", "0", "1"],
            ["0", "0", "0"],
            ["1", "0", "1"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 4)
    }

    // Land forms a ring — still one island
    func testRingIsland() {
        let grid: [[Character]] = [
            ["1", "1", "1"],
            ["1", "0", "1"],
            ["1", "1", "1"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 1)
    }

    // Thin horizontal strip across the middle
    func testHorizontalStrip() {
        let grid: [[Character]] = [
            ["0", "0", "0"],
            ["1", "1", "1"],
            ["0", "0", "0"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 1)
    }

    // Thin vertical strip down the middle
    func testVerticalStrip() {
        let grid: [[Character]] = [
            ["0", "1", "0"],
            ["0", "1", "0"],
            ["0", "1", "0"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 1)
    }

    // MARK: - Multiple islands

    func testTwoIslandsSideBySide() {
        let grid: [[Character]] = [
            ["1", "0", "1"],
            ["1", "0", "1"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 2)
    }

    func testCheckerboard() {
        let grid: [[Character]] = [
            ["1", "0", "1"],
            ["0", "1", "0"],
            ["1", "0", "1"]
        ]
        XCTAssertEqual(sut.numIslands(grid), 5)
    }

    // MARK: - BFS Base cases

    func testBFSAllWater() {
        let grid: [[Character]] = [
            ["0", "0"],
            ["0", "0"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 0)
    }

    func testBFSAllLand() {
        let grid: [[Character]] = [
            ["1", "1"],
            ["1", "1"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 1)
    }

    func testBFSSingleLandCell() {
        XCTAssertEqual(sut.numIslandsBFS([["1"]]), 1)
    }

    func testBFSSingleWaterCell() {
        XCTAssertEqual(sut.numIslandsBFS([["0"]]), 0)
    }

    // MARK: - BFS LeetCode examples

    // One large connected island
    func testBFSExample1() {
        let grid: [[Character]] = [
            ["1", "1", "1", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "0", "0", "0"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 1)
    }

    // Three separate islands
    func testBFSExample2() {
        let grid: [[Character]] = [
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "1", "0", "0"],
            ["0", "0", "0", "1", "1"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 3)
    }

    // MARK: - BFS Single row / single column

    func testBFSSingleRowAllLand() {
        let grid: [[Character]] = [["1", "1", "1"]]
        XCTAssertEqual(sut.numIslandsBFS(grid), 1)
    }

    func testBFSSingleRowAlternating() {
        let grid: [[Character]] = [["1", "0", "1", "0", "1"]]
        XCTAssertEqual(sut.numIslandsBFS(grid), 3)
    }

    func testBFSSingleColumnAllLand() {
        let grid: [[Character]] = [["1"], ["1"], ["1"]]
        XCTAssertEqual(sut.numIslandsBFS(grid), 1)
    }

    func testBFSSingleColumnAlternating() {
        let grid: [[Character]] = [["1"], ["0"], ["1"], ["0"], ["1"]]
        XCTAssertEqual(sut.numIslandsBFS(grid), 3)
    }

    // MARK: - BFS Connectivity

    // Diagonal land cells are NOT connected (only 4-directional)
    func testBFSDiagonalLandIsNotConnected() {
        let grid: [[Character]] = [
            ["1", "0"],
            ["0", "1"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 2)
    }

    // Each corner is a separate island
    func testBFSFourCornerIslands() {
        let grid: [[Character]] = [
            ["1", "0", "1"],
            ["0", "0", "0"],
            ["1", "0", "1"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 4)
    }

    // Land forms a ring — still one island
    func testBFSRingIsland() {
        let grid: [[Character]] = [
            ["1", "1", "1"],
            ["1", "0", "1"],
            ["1", "1", "1"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 1)
    }

    // Thin horizontal strip across the middle
    func testBFSHorizontalStrip() {
        let grid: [[Character]] = [
            ["0", "0", "0"],
            ["1", "1", "1"],
            ["0", "0", "0"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 1)
    }

    // Thin vertical strip down the middle
    func testBFSVerticalStrip() {
        let grid: [[Character]] = [
            ["0", "1", "0"],
            ["0", "1", "0"],
            ["0", "1", "0"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 1)
    }

    // MARK: - BFS Multiple islands

    func testBFSTwoIslandsSideBySide() {
        let grid: [[Character]] = [
            ["1", "0", "1"],
            ["1", "0", "1"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 2)
    }

    func testBFSCheckerboard() {
        let grid: [[Character]] = [
            ["1", "0", "1"],
            ["0", "1", "0"],
            ["1", "0", "1"]
        ]
        XCTAssertEqual(sut.numIslandsBFS(grid), 5)
    }
}
