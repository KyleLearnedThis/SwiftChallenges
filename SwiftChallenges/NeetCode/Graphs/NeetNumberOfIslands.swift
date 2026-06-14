//
//  NeetNumberOfIslands.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/13/26.
//

class NeetNumberOfIslands {

    // MARK: - DFS

    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var count = 0
        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                // Each unvisited land cell is the start of a new island
                if grid[r][c] == "1" {
                    dfs(&grid, r, c) // sink the entire island
                    count += 1
                }
            }
        }
        return count
    }

    // Flood-fills connected land to "0" so it isn't counted again
    private func dfs(_ grid: inout [[Character]], _ r: Int, _ c: Int) {
        // Base case: out of bounds or already water/visited
        guard r >= 0, r < grid.count,
              c >= 0, c < grid[0].count,
              grid[r][c] == "1" else { return }
        grid[r][c] = "0" // mark visited by sinking to water
        dfs(&grid, r - 1, c) // up
        dfs(&grid, r + 1, c) // down
        dfs(&grid, r, c - 1) // left
        dfs(&grid, r, c + 1) // right
    }

    // MARK: - BFS

    func numIslandsBFS(_ grid: [[Character]]) -> Int {
        var grid = grid
        var count = 0
        // The four cardinal directions to explore from each cell
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                guard grid[r][c] == "1" else { continue }

                // Found a new island — sink its root before enqueuing
                // to avoid adding it to the queue more than once
                count += 1
                grid[r][c] = "0"
                var queue = [(r, c)]

                while !queue.isEmpty {
                    let (row, col) = queue.removeFirst()
                    for (dr, dc) in directions {
                        let nr = row + dr
                        let nc = col + dc
                        guard nr >= 0, nr < grid.count,
                              nc >= 0, nc < grid[0].count,
                              grid[nr][nc] == "1" else { continue }
                        grid[nr][nc] = "0" // sink before enqueue to prevent duplicates
                        queue.append((nr, nc))
                    }
                }
            }
        }

        return count
    }
}
